class AddUpdalodToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :uploadtime, :datetime
    add_column :restaurants, :opening, :date
  end
end
