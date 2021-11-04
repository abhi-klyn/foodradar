class Restaurant < ApplicationRecord
  def self.search(search)
    if not search.nil?
      self.where(restaurant_name: search)
    else
      Restaurant.all
    end
  end
end
