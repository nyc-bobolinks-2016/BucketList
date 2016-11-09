class AddPhotoIdToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :photo_id, :integer
  end
end
