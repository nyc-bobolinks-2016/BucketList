class ActivitiesController < ApplicationController
  include ActivityHelper
  def show
    @activity = Activity.find_by(id: params[:id])
    if request.xhr?
      render json: @activity.parse_react
    else
      @activity
    end
  end

  def index
    @activity = suggest_next_activity
  end

end
