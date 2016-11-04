module PersonalitiesHelper

  def get_personality(content)
    profile_api_url = "https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2016-10-20&consumption_preferences=true&raw_scores=true"
    client = RestClient::Resource.new(profile_api_url, ENV["WATSON_API_KEY"], ENV["WATSON_API_SECRET"])
    insights = client.post content, :content_type => "text/plain"
  end

end
