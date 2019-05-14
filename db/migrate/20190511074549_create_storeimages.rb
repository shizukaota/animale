class CreateStoreimages < ActiveRecord::Migration[5.2]
  def change
    create_table :storeimages do |t|
      t.references :store, foreign_key: true
      t.string :image_id

      t.timestamps
    end
  end
end
