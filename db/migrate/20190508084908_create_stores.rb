class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :storename
      t.string :city
      t.string :category
      t.string :system
      t.string :menu
      t.string :image_id
      t.string :place
      t.string :tag_list
      t.string :phone_number
      t.timestamps
    end
  end
end
