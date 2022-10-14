Rails.application.routes.draw do

  get 'users/index'  
  resources :users
  get 'users/new', to: 'users#new'
  post 'users', to: 'users#create'
  delete 'users/:id', to: 'users#destroy'
  
  get 'tweets/index'  
  resources :tweets
  get 'tweets/new', to: 'tweets#new'
  post 'tweets', to: 'tweets#create'
  delete 'tweets/:id', to: 'tweets#destroy'
  
  get 'top/index'
  #resources :top
  root 'top#index'
  get 'top/login_form'
  post 'top/login_form'
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  
  get 'likes/index'  
  resources :tweets
  post 'likes', to: 'likes#create'
  delete 'likes/:id', to: 'likes#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
