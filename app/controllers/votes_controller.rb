class VotesController < ApplicationController
  include VotesHelper
  include ActivityHelper

  def create
    @activity = Activity.find_by(id: params[:activity_id])
    vote_value = params[:voteType]
    @vote = Vote.new(user: current_user, activity: @activity) unless Vote.already_created(current_user, @activity)

    if @vote
      if vote_value == "down"
        @vote.vote_value = false
        @activity = downvote_activity(@activity)
        @activity.save
      elsif vote_value == "up"
        @vote.vote_value = true
        @activity = upvote_activity(@activity)
        @list_item = ListItem.create(user: current_user, activity: @activity) unless ListItem.already_created(current_user, @activity)
        @activity.save
      elsif vote_value == "done"
        @vote.vote_value = true
        @activity = upvote_activity(@activity)
        @list_item = ListItem.create(user: current_user, activity: @activity, checked: true) unless ListItem.already_created(current_user, @activity)
        @activity.save
      end
      if @vote
        @vote.save
      end
      render json: suggest_next_activity.parse_react
    end
  end

end
