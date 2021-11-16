json.extract! review, :id, :review_text, :restaurant_name, :created_at, :updated_at
json.url review_url(review, format: :json)
