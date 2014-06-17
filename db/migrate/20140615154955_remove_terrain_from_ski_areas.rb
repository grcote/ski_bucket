class RemoveTerrainFromSkiAreas < ActiveRecord::Migration
  def up
    remove_column :ski_areas, :pct_black
    remove_column :ski_areas, :pct_blue
    remove_column :ski_areas, :pct_green
    remove_column :ski_areas, :visited
  end

  def down
    add_column :ski_areas, :pct_black, :integer
    add_column :ski_areas, :pct_blue, :integer
    add_column :ski_areas, :pct_green, :integer
    add_column :ski_areas, :visited, :boolean
  end
end
