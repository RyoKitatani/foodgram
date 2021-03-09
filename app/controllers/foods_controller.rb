class FoodsController < ApplicationController
  
  def index
    @food = Food.new
    @foods = Food.all
  end
  
  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    @food.save
    redirect_to foods_path
  end

  def destroy
    @food = Food.find(params[:id])
    @food.user_id = current_user.id
    @food.destroy
    redirect_to foods_path
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
  end
  
  private
  
  def food_params
    params.require(:food).permit(:shop_name, :caption, :image)
  end
  
end
