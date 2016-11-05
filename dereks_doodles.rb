require 'rest-client'
require 'byebug'
require 'pry'

def upvote(user_num, activity_num)
  activity_num += 0.1*(user_num - activity_num)
end

def downvote(user_num, activity_num)
  if user_num > activity_num
    activity_num -= 0.1*(1-(user_num - activity_num))
  elsif user_num < activity_num
    activity_num += 0.1*(1-(activity_num - user_num))
  end
end


activity_num = 0.1
user_num = 0.8






# input = ''
# while input != 'e'
#    puts "Enter Vote:"
#    input = gets.chomp
#    if input == "u"
#      activity_num = upvote(user_num, activity_num)
#    elsif input == "d"
#      activity_num = downvote(user_num, activity_num)
#    end
#    puts "Score: #{activity_num}"
# end


profile_api_url = "https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2016-10-20&consumption_preferences=true&raw_scores=true"

  client = RestClient::Resource.new(profile_api_url, "", "")
  insights = client.post content, :content_type => "text/plain"
  puts insights
