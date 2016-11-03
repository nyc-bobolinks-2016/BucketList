class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :activity_id
      t.boolean :vote_value
      
      t.timestamps
    end
  end
end
