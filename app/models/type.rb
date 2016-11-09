class Type < ApplicationRecord
  include NounprojectModule

  def icon_url(id)
    url_icon = JSON.parse(get_icon((id).to_s))
    url_icon["icon"]["preview_url"]
  end
end
