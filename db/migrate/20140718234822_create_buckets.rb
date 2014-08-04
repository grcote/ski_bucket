class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.belongs_to :user, null: false
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
