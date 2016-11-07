class AddComfortZone < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :comfortzone, :float, , :default => 0.0

  end
end
