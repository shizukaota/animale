Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :stores do

	   resources :favorites, only: [:index,:create, :destroy] do
	   end

	   resources :posts
   end

end
