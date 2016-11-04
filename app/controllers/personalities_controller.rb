class PersonalitiesController < ApplicationController
  def show
    @personality = Personality.find(params[:id])
  end
end
