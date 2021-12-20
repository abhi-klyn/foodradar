 class FoodsController < ApplicationController
  before_action :set_food, only: %i[ show edit update destroy ]

  # GET /foods or /foods.json
  def index
    @foods = nil
    if params[:food_name] && params[:food_name] != ""
      records = execute_statement("SELECT DISTINCT food_name FROM foods WHERE LOWER(food_name) LIKE LOWER('%"+params[:food_name]+"%')")
      if records    
        len = records.length()

        # set @foods to first match
        @foods = Food.search(records[0].fetch("food_name"))

        # merge any other matches with existing restaurant
        for i in 1..len-1 do
          @foods = @foods.or(Food.search(records[i].fetch("food_name")))
        end

      else
        @foods = Food.search(params[:food_name])
      end

    elsif params[:food_name] == ""
      @foods = Food.search(nil)
    else
      @foods = Food.search(params[:food_name])

    end
    if(params.has_key?(:sort_by))
      if(params[:sort_by] == 'rating')
        @foods = @foods.sort_by(&:rating).reverse
      elsif (params[:sort_by] == 'price')
        @foods = @foods.sort_by(&:price)
      elsif (params[:sort_by] == 'restaurant_name')
        @foods = @foods.sort_by(&:restaurant_name)
      end
    end
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:food_name, :description, :price, :rating, :food_name, :search)
    end
end
