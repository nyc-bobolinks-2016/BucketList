class Activity < ApplicationRecord
    include NounprojectModule

  def mb_to_bigfive(mb_type)
    self.op = mb_type[1] == "S" ? 0.25 : 0.75
    self.co = mb_type[3] == "J" ? 0.25 : 0.75
    self.ex = mb_type[0] == "I" ? 0.25 : 0.75
    self.ag = mb_type[2] == "F" ? 0.25 : 0.75
    self.ne = 0.5
  end

  def icon_url
    url_icon = JSON.parse(get_icon(rand(20).to_s))
    url_icon["icon"]["preview_url"]
  end

  def parse_react
    act = {
        ag: self.ag,
        co: self.co,
        created_at: self.created_at,
        ex: self.ex,
        id: self.id,
        ne: self.ne,
        op: self.op,
        title: self.title,
        updated_at: self.updated_at,
        img_url: self.icon_url
      }
  end

end
