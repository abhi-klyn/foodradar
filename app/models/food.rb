class Food < ApplicationRecord
  def self.search(search)
    if not search.nil?
      puts("Here")
      self.where(food_name: search)
    else
      puts("There")
      Food.all
    end
  end

  def self.searchByRestaurant(restaurant)
    if not restaurant.nil?
      puts("Here")
      self.where(restaurant_name: restaurant)
    else
      return nil
    end
  end
end
