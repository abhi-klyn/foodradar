json.extract! food, :id, :food_name, :description, :price, :rating, :restaurant_name, :created_at, :updated_at
json.url food_url(food, format: :json)
