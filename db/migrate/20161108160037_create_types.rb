class CreateTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :types do |t|
      t.string :title
      t.string :nickname
      t.string :content
      t.timestamps
    end
  end
end
