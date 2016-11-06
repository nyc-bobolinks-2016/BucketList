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

  def sloan_notation
    @personality_scores = JSON.parse(self.scores)["personality"]
    @sloan = ""
    @sloan += @personality_scores[2]["percentile"] >= 0.5 ? "S" : "R"
    @sloan += @personality_scores[4]["percentile"] >= 0.5 ? "L" : "C"
    @sloan += @personality_scores[1]["percentile"] >= 0.5 ? "O" : "U"
    @sloan += @personality_scores[3]["percentile"] >= 0.5 ? "A" : "E"
    @sloan += @personality_scores[0]["percentile"] >= 0.5 ? "N" : "I"
  end

  def convert_to_mb
    @conversion_hash = {
      "RCUAI" => "INFP",
      "RLUAI" => "INFP",
      "RCUEI" => "INTP",
      "RLUEI" => "INTP",
      "RCOAI" => "INFJ",
      "RLOAI" => "INFJ",
      "RCOEI" => "INTJ",
      "RLOEI" => "INTJ",
      "RCOEN" => "ISTJ",
      "RLOEN" => "ISTJ",
      "RCOAN" => "ISFJ",
      "RLOAN" => "ISFJ",
      "RCUEN" => "ISTP",
      "RLUEN" => "ISTP",
      "RCUAN" => "ISFP",
      "RLUAN" => "ISFP",
      "SCUAI" => "ENFP",
      "SLUAI" => "ENFP",
      "SCUEI" => "ENTP",
      "SLUEI" => "ENTP",
      "SCOAI" => "ENFJ",
      "SLOAI" => "ENFJ",
      "SCOEI" => "ENTJ",
      "SLOEI" => "ENTJ",
      "SCOEN" => "ESTJ",
      "SLOEN" => "ESTJ",
      "SCOAN" => "ESFJ",
      "SLOAN" => "ESFJ",
      "SCUEN" => "ESTP",
      "SLUEN" => "ESTP",
      "SCUAN" => "ESFP",
      "SLUAN" => "ESFP"
    }
    @conversion_hash[sloan_notation]
  end

end
