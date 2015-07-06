class CreateCandies < ActiveRecord::Migration
  def change
    create_table :candies do |t|
      t.string :name 
      t.integer :pieces
      t.integer :size
      t.integer :house_id
      t.integer :bucket_id
      t.timestamps null: false
    end
  end
end