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



content = "I hopped off the double-decker carousal, my mother, sister and I meandered through the

packed cobblestone square. The very center of the square was filled with cappuccino sippers and

people watchers. The small city of Avignon had been transformed in celebration of their annual

theatre festival; we blended into the crowd along with extravagantly costumed performers,

Frenchmen with zoos of balloon animals floating overhead, and locals reveling cheerfully in the

spirit of the festival.

After watching a dance crew do the twists and turns that television and movies only try to

recreate, we continued to wander down the central avenue. The trees framed the road perfectly,

like an archway protecting the magic that was taking place underneath. It was dark, and the dim

street lights made it difficult to read the posters that plastered all available wall space. Edging

past the grand piano somehow positioned in the middle of the street, we came to a growing

cluster of people gathering around a tall slender street performer. He strutted around his

impromptu performance space, mimicking and pestering passersby and challenging anyone to

leave. The eager crowd swelled as the show began. He spoke in rapid-fire French; I furrowed

my brow, determined not to be intimidated.  He started taking role call, “Français?” “Italiano?”

“Deutsch?” he boomed with a toothy grin. Onlookers raised their hands excitedly as the

recognized their language. “English? English speakers?” My sister’s hand shot up. His face

reminded me of a young child, about to do something really naughty. His eyes locked in, he

came marching toward us, and he grinned at me as he reached for my clueless older sister, who

had inadvertently volunteered to be the leading lady of his show.

The slender man was no hypnotist but his show had the same affect. His voice was

commanding when he was instructing my sister what to do, playing off the fact that she did not

comprehend the language. Although I did not understand his words, I was captivated and could

not look away. The performance was hilarious and entertaining. I thought about the importance

of this type of nonverbal communication in my life, and I thought of my brother back home.

Brian, lovingly called Bubby, is sixteen and has severe mental retardation. Growing up with a

younger brother who cannot talk taught me that words are not always necessary. From

demanding that we change the channel to asking for a drink of water, we always understand what

he wants. Sometimes the look in his eye or a shift his weight is more telling than if he could

speak.

I realized that the same subtleties of interpersonal communication that I learned from my

brother, explained how this street show was accessible to people of many different cultures and

language backgrounds. His tone and inflection, things not easily quantifiable, are what made the

street performer’s jokes side-splitting. As the performance progressed, I also became acutely

aware of the effectiveness his body language in my understanding. The street performer

reprimanded his volunteers when they made errors, the wagging of his finger and the raising of

his eyebrows, letting the entire audience know when someone goofed. Brian also taught me

how crucial this part of communication is. His slobbery kisses, his fake wailing for attention,

and random outbursts realized with a whack in the face are all means for Brian to get his point

across without words. Although the way Brian uses his body language differs from the French

performer’s utilization, it highlighted to me the importance of this alternative form of nonverbal

communication.

Warm tears that streamed down my face that night from too much laughter. My cheeks

were tired and stiff from grinning. The next morning I recalled the events and jokes that kept me

smiling through my slumber. That night confirmed for me that my background makes me a

strong contender for understanding all types of communication and that Brian, by aiding in my

understanding of nonverbal communication, has made me a more compassionate person than I

could be otherwise. The way Brian is limited in his communication has forced me to push the

boundaries of my own. That night was not some painful monologue in French: it was

interactive, comical, and eccentric. I understood the performance completely, just like I

understand my baby brother, who helps me transcend traditional communication every day. I

am proud that I can share my understanding of these nuances of communication throughout my

lifetime."


profile_api_url = "https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2016-10-20&consumption_preferences=true&raw_scores=true"

  client = RestClient::Resource.new(profile_api_url, "e88727ce-0278-48cd-b7f7-806b2cd9af02", "RXCUKEhdaHHL")
  insights = client.post content, :content_type => "text/plain"
  puts insights
