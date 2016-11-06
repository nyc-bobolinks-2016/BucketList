class VotesController < ApplicationController

  def create
    @activity = Activity.find_by(id: params[:activity_id])
    vote_value = params[:voteType]
    if vote_value == "down"
      @vote = Vote.new(user: current_user, vote_value: false, activity: @activity )
    elsif vote_value == "up"
      @vote = Vote.new(user: current_user, vote_value: true, activity: @activity )
    end
    @vote.save
    render json: Activity.find_by(id: rand(40))

  end

end
