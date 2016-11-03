class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.text :title, null: false
      t.float :op
      t.float :co
      t.float :ex
      t.float :ag
      t.float :ne

      t.timestamps
    end
  end
end
