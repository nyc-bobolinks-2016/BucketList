class AddPhotoToTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :types, :photo_id, :integer
  end
end
