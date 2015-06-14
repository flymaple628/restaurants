class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :price
      t.date :ready_time
      t.date :remove_time
      t.integer :orderby
      t.string :tag

      t.timestamps null: false
    end
  end
end
