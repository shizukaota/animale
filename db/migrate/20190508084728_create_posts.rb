class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :store_id
      t.string :comment
      t.string :image_id
      t.timestamps
    end
  end
end
