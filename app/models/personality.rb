class Personality < ApplicationRecord
  belongs_to :user

  def parse_personality
    JSON.parse(scores)
  end
end
