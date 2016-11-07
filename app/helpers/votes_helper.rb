module VotesHelper

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

  def upvote_activity(activity)
    @user = current_user
    activity.op = upvote(@user.personality.op, activity.op)
    activity.co = upvote(@user.personality.co, activity.co)
    activity.ex = upvote(@user.personality.ex, activity.ex)
    activity.ag = upvote(@user.personality.ag, activity.ag)
    activity.ne = upvote(@user.personality.ne, activity.ne)
    activity
  end

  def downvote_activity(activity)
    @user = current_user
    activity.op = downvote(@user.personality.op, activity.op)
    activity.co = downvote(@user.personality.co, activity.co)
    activity.ex = downvote(@user.personality.ex, activity.ex)
    activity.ag = downvote(@user.personality.ag, activity.ag)
    activity.ne = downvote(@user.personality.ne, activity.ne)
    activity
  end
end
