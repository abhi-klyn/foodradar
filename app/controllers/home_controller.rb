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
      puts "here"
      
      
      restaurant_list = []
      records = execute_statement("SELECT DISTINCT restaurant_name FROM restaurants WHERE LOWER(restaurant_name) LIKE LOWER('%"+params[:restaurant_name]+"%')")
      if records
        records.each do |row|
          restaurant_list.push(Restaurant.search(row.fetch("restaurant_name")))
        end
      
        len = records.length()
        puts len
        @restaurants = Restaurant.search(records[0].fetch("restaurant_name"))

        for i in 1..len-1 do
          @restaurants = @restaurants.or(Restaurant.search(records[i].fetch("restaurant_name")))
        end

      else
        @restaurants = Restaurant.search(params[:restaurant_name])
      end

    elsif params[:restaurant_name] == ""
      puts "elsif"
      params[:restaurant_name] = nil
      @restaurants = Restaurant.search(params[:restaurant_name])
    else
      puts "else"
      @restaurants = Restaurant.search(params[:restaurant_name])
      puts "class"
      puts @restaurants.class
      puts "class"
      puts @restaurants
    end
    
    
    
    

    


  end
end
