require 'rest-client'

class PersonalitiesController < ApplicationController
  def show
    @personality = Personality.find(params[:id])
    @scores = @personality.parse_personality
  end

  def new
  end




  def create
    # @personality = Personality.new
    # @personality.user = current_user
    # @content =
    # @personality.score = get_personality(@content)
    # @personality.
  end
end
