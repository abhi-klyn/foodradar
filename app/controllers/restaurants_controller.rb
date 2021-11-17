# ========= Lines commented out below are not used for iter1 ===========
# ========= Will later be implemented and used in iter2 =========
require 'sentimental'
class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy ]

  # GET /restaurants or /restaurants.json
  def index
   @restaurants = Restaurant.all
  end

  def save
    # puts params
    @new_review = Review.new()
    @new_review.restaurant_name = params[:restaurant][:restaurant_name]
    @new_review.review_text = params[:review_text]
    @new_review.username = params[:username]
    process_review(params[:review_text])
     respond_to do |format|
       if @new_review.save
         format.html { redirect_to request.referrer, notice: "Review was successfully created." }
       else
         format.html { render :new, status: :unprocessable_entity }
         format.json { render json: @restaurant.errors, status: :unprocessable_entity }
       end
     end
  end

  def process_review(review_text)
    statement = "SELECT foods.food_name, similarity(foods.food_name, '#{review_text}') AS score FROM foods JOIN restaurants ON foods.restaurant_name = restaurants.restaurant_name order by score desc limit 1"
    records = execute_statement(statement)
    analyzer = Sentimental.new
    analyzer.load_defaults
    analyzer.threshold = 0.1
    puts analyzer.sentiment review_text
    records.each do |row|
      puts row
    end
  end

  # GET /restaurants/1 or /restaurants/1.json
  def show
    @foods = Food.searchByRestaurant(@restaurant[:restaurant_name])
    @reviews = Review.searchByRestaurant(@restaurant[:restaurant_name])
  end

  # GET /restaurants/new
  def new
   @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants or /restaurants.json
  def create
   @restaurant = Restaurant.new(restaurant_params)

   respond_to do |format|
     if @restaurant.save
       format.html { redirect_to @restaurant, notice: "Restaurant was successfully created." }
       format.json { render :show, status: :created, location: @restaurant }
     else
       format.html { render :new, status: :unprocessable_entity }
       format.json { render json: @restaurant.errors, status: :unprocessable_entity }
     end
   end
  end

  # PATCH/PUT /restaurants/1 or /restaurants/1.json
  def update
   respond_to do |format|
     if @restaurant.update(restaurant_params)
       format.html { redirect_to @restaurant, notice: "Restaurant was successfully updated." }
       format.json { render :show, status: :ok, location: @restaurant }
     else
       format.html { render :edit, status: :unprocessable_entity }
       format.json { render json: @restaurant.errors, status: :unprocessable_entity }
     end
   end
  end

  # DELETE /restaurants/1 or /restaurants/1.json
  def destroy
   @restaurant.destroy
   respond_to do |format|
     format.html { redirect_to restaurants_url, notice: "Restaurant was successfully destroyed." }
     format.json { head :no_content }
   end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
     params.require(:restaurant).permit(:restaurant_name, :address, :cuisine)
    end
end
