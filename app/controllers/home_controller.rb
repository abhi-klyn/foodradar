class HomeController < ApplicationController
  def index
    # Food search functionality is not part of the iter1 implementation
    #if params.key?(:food_name)
    #  @foods = Food.search(params[:food_name])
    #else
      @restaurants = Restaurant.search(params[:restaurant_name])
    #end
    records = execute_statement("SELECT * FROM restaurants")
    records.each do |row|
        puts row
    end
  end
end
