class User < ApplicationRecord
  has_secure_password
  has_many :votes
  has_many :list_items
  has_many :activities, through: :list_items
  has_one :personality

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
