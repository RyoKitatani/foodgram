Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "homes#top"
  resources :foods, only:[:index, :show, :edit, :update, :create, :destroy] do
    resources :food_comments, only:[:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only:[:index, :show, :edit, :update]
  resources :maps, only:[:index]
  get '/map_request', to: 'maps#map', as: 'map_request'
  
  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'
  #フォローとフォローを外すアクション
  
  get 'users/follow_list/:user_id' => 'users#follow_list'
  get 'users/follower_list/:user_id' => 'users#follower_list'
  #フォロー・フォロワーの一覧ページ
  
  get '/search', to: 'searches#search'
  
end
