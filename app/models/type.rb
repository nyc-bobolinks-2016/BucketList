class Type < ApplicationRecord
  include NounprojectModule

  def icon_url
    begin
      url_icon = JSON.parse(get_icon(self.photo_id.to_s))
      url_icon["icon"]["preview_url"]
    rescue
      url_icon = "https://dbcbucketlist.herokuapp.com/bucket.png"
    end
  end

end
