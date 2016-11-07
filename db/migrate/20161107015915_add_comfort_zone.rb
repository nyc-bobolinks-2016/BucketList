class AddComfortZone < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :comfortzone, :float
  end
end
