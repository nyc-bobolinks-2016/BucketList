class CreatePersonalities < ActiveRecord::Migration[5.0]
  def change
    create_table :personalities do |t|
      t.text :scores
      t.float :op
      t.float :co
      t.float :ex
      t.float :ag
      t.float :ne


      t.timestamps
    end
  end
end
