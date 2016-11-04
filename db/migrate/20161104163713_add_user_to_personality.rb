class AddUserToPersonality < ActiveRecord::Migration[5.0]
  def change
    add_column :personalities, :user_id, :integer
  end
end
