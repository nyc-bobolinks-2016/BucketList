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






input = ''
while input != 'e'
   puts "Enter Vote:"
   input = gets.chomp
   if input == "u"
     activity_num = upvote(user_num, activity_num)
   elsif input == "d"
     activity_num = downvote(user_num, activity_num)
   end
   puts "Score: #{activity_num}"
end
