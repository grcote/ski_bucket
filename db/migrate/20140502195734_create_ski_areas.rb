class CreateSkiAreas < ActiveRecord::Migration
  def change
    create_table :ski_areas do |t|
      t.string :ski_area_name
    end
  end
end
