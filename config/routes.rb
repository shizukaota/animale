Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :stores
  resources :posts
  resources :favorites, only:[:create, :destory, :index]
end
