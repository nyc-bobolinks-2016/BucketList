module TwitterModule

  def search(user)

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_API_SECRET"]
    end

    begin
      @timeline = client.search("from:#{user}")
    rescue
      @timeline = []
    end
  end

  def parse_tweets(tweet_array)
    @tweet_transcript = ""
    tweet_array.each do |tweet|
      @tweet_transcript += "#{tweet.text}\n"
    end
    @tweet_transcript
  end

end
