class ActivitiesController < ApplicationController

  def show
    @activity = Activity.find_by(id: params[:id])
    if request.xhr?
      render json: @activity
    else
      @activity
    end
  end

  def index
    @activity = Activity.all.sample
  end

end
