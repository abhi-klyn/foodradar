class Review < ApplicationRecord
  def self.searchByRestaurant(restaurant)
    if not restaurant.nil?
      self.where(restaurant_name: restaurant)
    else
      return nil
    end
  end
end
