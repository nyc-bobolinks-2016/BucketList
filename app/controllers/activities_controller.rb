class ActivitiesController < ApplicationController
  include ActivityHelper

  def index
    @activity = suggest_next_activity
    if request.xhr?
      render json: @activity.parse_react
    else
      @activity
    end
  end

  # def show
  #   byebug
  #   @activity = suggest_next_activity
  #   if request.xhr?
  #     render json: @activity.parse_react
  #   else
  #     @activity
  #   end
  # end



end
