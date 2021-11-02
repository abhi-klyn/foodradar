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
end
