class AddCheckedToListItems < ActiveRecord::Migration[5.0]
  def change
    add_column :list_items, :checked, :boolean
  end
end
