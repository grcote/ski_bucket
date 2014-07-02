class AddFieldsToSkiAreas < ActiveRecord::Migration
  def change
    add_column(:ski_areas, :country, :string)
    add_column :ski_areas, :state, :string
    add_column :ski_areas, :pct_black, :integer
    add_column :ski_areas, :pct_blue, :integer
    add_column :ski_areas, :pct_green, :integer
    add_column :ski_areas, :logo_url, :string
    add_column :ski_areas, :visited, :boolean
    add_column :ski_areas, :skiable_acres, :integer
  end
end
