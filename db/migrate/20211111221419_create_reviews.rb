class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :review_text
      t.string :restaurant_name


      t.timestamps
    end
  end
end
