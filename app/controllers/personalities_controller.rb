require 'rest-client'

class PersonalitiesController < ApplicationController
  def show
    @personality = Personality.find(params[:id])
    @scores = @personality.parse_personality
  end

  def new
    @user = current_user
    @personality = Personality.new
  end

  def create
    byebug
  end

end
