class HomeController < ApplicationController
  def index
    puts "Index"
    puts params
    @foods = Food.search(params[:food_name])
  end
end
