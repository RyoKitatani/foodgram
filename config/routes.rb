Rails.application.routes.draw do
  devise_for :users
  root to: "foods#index"
  resources :foods, only:[:index, :show, :edit, :update, :create, :destroy] do
    resources :food_comments, only:[:create, :destroy]
  end
  
end
