class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :store, foreign_key: true
      t.string :drink
      t.string :food

      t.timestamps
    end
  end
end
