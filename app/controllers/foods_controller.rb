class FoodsController < ApplicationController
  
  def index
    @foods = Food.all.order(id: "DESC")
    @food = Food.new
  end
  
  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    @food.save
    @foods = Food.all.order(id: "DESC")
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
