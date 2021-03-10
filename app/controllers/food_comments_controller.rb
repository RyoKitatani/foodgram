class FoodCommentsController < ApplicationController
  
  def create
    food = Food.find(params[:food_id])
    comment = current_user.food_comments.new(food_comment_params)
    comment.food_id = food.id
    comment.save
    redirect_to food_path(food)
  end
   
  def destroy
    FoodComment.find_by(id: params[:id], food_id: params[:food_id]).destroy
    redirect_to food_path(params[:food_id])
  end
  
   private

  def food_comment_params
    params.require(:food_comment).permit(:comment)
  end
  
end
