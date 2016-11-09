class Type < ApplicationRecord
  include NounprojectModule

  def icon_url
    url_icon = JSON.parse(get_icon((self.photo_id).to_s))
    url_icon["icon"]["preview_url"]
  end
end
