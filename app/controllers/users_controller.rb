class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @foods = @user.foods.page(params[:page]).reverse_order
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  
  def follow
      @user = User.find(params[:user_id])
      current_user.follow(@user)
      redirect_to user_path(@user)
  end
#フォローする

  def unfollow
      @user = User.find(params[:user_id])
      current_user.stop_following(@user)
      redirect_to user_path(@user)
  end
#フォローを外す


  def follow_list
    @user = User.find(params[:user_id])
  end
#フォローしてる人の一覧ページ

  def follower_list
    @user = User.find(params[:user_id])
  end
#フォロワーの一覧ページ
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
    
end
