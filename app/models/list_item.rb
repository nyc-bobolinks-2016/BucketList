class ListItem < ApplicationRecord
  belongs_to :user
  belongs_to :activity


  def self.already_created(current_user, activity)
    !ListItem.find_by(user_id:current_user.id, activity_id: activity.id).nil?
  end

end
