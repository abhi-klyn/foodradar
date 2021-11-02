class HomeController < ApplicationController
  def index
    puts "Index"
    if params.key?(:food_name)
      @foods = Food.search(params[:food_name])
    else
      @restaurants = Restaurant.search(params[:restaurant_name])
    end
  end
end
