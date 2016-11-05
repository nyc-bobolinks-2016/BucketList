class Personality < ApplicationRecord
  belongs_to :user

  def parse_personality
    JSON.parse(scores)
  end

  def map_big_five(scores)
    self.op = scores["personality"][0]["raw_score"]
    self.co = scores["personality"][1]["raw_score"]
    self.ex = scores["personality"][2]["raw_score"]
    self.ag = scores["personality"][3]["raw_score"]
    self.ne = scores["personality"][4]["raw_score"]
  end

end
