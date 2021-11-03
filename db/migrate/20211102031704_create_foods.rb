class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :food_name
      t.string :description
      t.integer :price
      t.integer :rating
      t.string :restaurant_name

      t.timestamps
    end
  end
end
