class HomeController < ApplicationController
  def index
    # Food search functionality is not part of the iter1 implementation
    #if params.key?(:food_name)
    #  @foods = Food.search(params[:food_name])
    #else
    
    #puts "printing var restaurants"
    #puts @restuarants
    #end
    '''
    records = execute_statement("SELECT * FROM restaurants")
    records.each do |row|
        puts row
    
    puts params[:restaurant_name]
    @records
    end
    '''

    
    @restaurants = nil
    if params[:restaurant_name] && params[:restaurant_name] != ""
      records = execute_statement("SELECT DISTINCT restaurant_name FROM restaurants WHERE LOWER(restaurant_name) LIKE LOWER('%"+params[:restaurant_name]+"%')")
      if records    
        len = records.length()

        # set @restaurants to first match
        @restaurants = Restaurant.search(records[0].fetch("restaurant_name"))

        # merge any other matches with existing restaurant
        for i in 1..len-1 do
          @restaurants = @restaurants.or(Restaurant.search(records[i].fetch("restaurant_name")))
        end

      else
        @restaurants = Restaurant.search(params[:restaurant_name])
      end

    elsif params[:restaurant_name] == ""
      @restaurants = Restaurant.search(nil)
    else
      @restaurants = Restaurant.search(params[:restaurant_name])

    end
    
    if(params.has_key?(:sort_by))
      if(params[:sort_by] == "restaurant_name")
        @restaurants = @restaurants.sort_by(&:restaurant_name)
      elsif(params[:sort_by] == "cuisine")
        @restaurants = @restaurants.sort_by(&:cuisine)
      end
    end
  end
end
