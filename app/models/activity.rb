class Activity < ApplicationRecord

  def mb_to_bigfive(mb_type)
    self.op = mb_type[1] == "S" ? 0.25 : 0.75
    self.co = mb_type[3] == "J" ? 0.25 : 0.75
    self.ex = mb_type[0] == "I" ? 0.25 : 0.75
    self.ag = mb_type[2] == "F" ? 0.25 : 0.75
    self.ne = 0.5
  end

end
