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
  end

  # GET /foods/1 or /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: "Food was successfully created." }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: "Food was successfully updated." }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: "Food was successfully destroyed." }
      format.json { head :no_content }
    end
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
