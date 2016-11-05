require 'rest-client'

class PersonalitiesController < ApplicationController
  include TwitterModule
  include PersonalitiesHelper

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
    @personality = Personality.new
  end

  def create
    @personality = Personality.new
    @personality.user = current_user
    @content = params["text_to_analyze"]
    unless params["@twitter"] == ""
      @twitter_feed = search(params["@twitter"])
      @tweet_transcript = parse_tweets(@twitter_feed)
      @content += "\n #{@tweet_transcript}"
    end
    @scores = get_personality(@content)
    @personality.scores = JSON.generate(@scores)
    @personality.map_big_five(@scores)
    @personality.save
    redirect_to @personality
  end

end
