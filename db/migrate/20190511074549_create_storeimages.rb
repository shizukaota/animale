class CreateStoreimages < ActiveRecord::Migration[5.2]
  def change
    create_table :storeimages, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :store, foreign_key: true
      t.string :image_id

      t.timestamps
    end
  end
end
