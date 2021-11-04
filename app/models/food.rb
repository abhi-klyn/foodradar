class Food < ApplicationRecord
  def self.search(search)
    if not search.nil?
      self.where(food_name: search)
    else
      Food.all
    end
  end

  def self.searchByRestaurant(restaurant)
    if not restaurant.nil?
      self.where(restaurant_name: restaurant)
    else
      return nil
    end
  end
end
