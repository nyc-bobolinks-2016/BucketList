require 'rest-client'

class PersonalitiesController < ApplicationController
  def show
    # @personality = Personality.find(params[:id])
    # @scores = @personality.parse_personality
    content = ""


    profile_api_url = "https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2016-10-20&consumption_preferences=true&raw_scores=true"

      client = RestClient::Resource.new(profile_api_url, "e88727ce-0278-48cd-b7f7-806b2cd9af02", "RXCUKEhdaHHL")
      insights = client.post content, :content_type => "text/plain"
    @scores = JSON.parse(insights)
  end

  def new
    @user = current_user
    @personality = Personality.new
  end
  
end
