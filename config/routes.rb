Rails.application.routes.draw do

  devise_for :users
  root 'stores#index'

  resources :users do

     resources :favorites, only: [:index,:destroy, :create]

     resources :posts, only: [:create, :index,:edit,:update,:destroy]
   end
  resources :posts, only: [:show]

  resources :stores do
    resources :favorites, only: [:create, :destroy]
    resources :posts, only: [:index, :create ]
  end
  post 'tagsearchs' => 'searchs#tagsearch'
  post 'wordsearchs' => 'searchs#wordsearch'
  get 'searchresult' => 'searchs#index'
  get 'lists' => 'posts#list'
end
