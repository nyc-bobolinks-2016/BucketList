module ActivityHelper

  def get_difference(activity)
    @cumulative_difference = 0.0
    @cumulative_difference += (activity.op - current_user.personality.op).abs
    @cumulative_difference += (activity.co - current_user.personality.co).abs
    @cumulative_difference += (activity.ex - current_user.personality.ex).abs
    @cumulative_difference += (activity.ag - current_user.personality.ag).abs
    @cumulative_difference += (activity.ne - current_user.personality.ne).abs
    @cumulative_difference
  end

  def suggest_next_activity
    @possible_activities = Activity.all - current_user.voted_activities
    @match = false
    while @match == false
      @next_activity = @possible_activities.sample
      @possible_activities -= [@next_activity]
      @match = true
      5.times do
        @rnum = rand(0.0..5.0) + 2.5*current_user.comfortzone
        @match = false if get_difference(@next_activity) > @rnum
      end
    end
    @next_activity
  end

end
