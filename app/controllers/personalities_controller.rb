require 'rest-client'

class PersonalitiesController < ApplicationController
  def show
    @personality = Personality.find(params[:id])
    @scores = @personality.parse_personality
  end

  def create
    # @personality = Personality.new
    # @personality.user = current_user
    # @content =
    # @personality.score = get_personality(@content)
    # @personality.
  end

  def new
    @user = current_user
    @personality = Personality.new
  end

end
