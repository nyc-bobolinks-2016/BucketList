require 'rest-client'

class PersonalitiesController < ApplicationController
  def show
    if current_user
      @personality = Personality.find(params[:id])
      @scores = @personality.parse_personality
    else
      flash[:notice] = "Please log in to view this page."
      redirect_to '/login'
    end
  end

  def new
    @user = current_user
    @personality = Personality.new
  end

  def create

  end

end
