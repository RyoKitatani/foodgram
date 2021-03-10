class FoodsController < ApplicationController
  
  def index
    @foods = Food.page(params[:page]).reverse_order
    @food = Food.new
  end
  
  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    @food.save
    @foods = Food.page(params[:page]).reverse_order
  end

  def destroy
    @food = Food.find(params[:id])
    @food.user_id = current_user.id
    @food.destroy
    redirect_to foods_path
  end

  def show
    @food = Food.new
    @food_detail = Food.find(params[:id])
    @food_comment = FoodComment.new
  end

  def edit
    @food_detail = Food.find(params[:id])
  end
  
  def update
     @food_detail = Food.find(params[:id])
     @food_detail.update(food_params)
     redirect_to food_path(@food_detail)
  end
  
  private
  
  def food_params
    params.require(:food).permit(:shop_name, :caption, :image)
  end
  
end
