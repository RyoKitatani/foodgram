Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :foods, only:[:index, :show, :edit, :update, :create, :destroy] do
    resources :food_comments, only:[:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only:[:show, :edit, :update]
end
