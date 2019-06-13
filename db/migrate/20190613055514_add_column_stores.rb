class AddColumnStores < ActiveRecord::Migration[5.2]
  def change
   rename_column :stores, :categor, :category
  end
end
