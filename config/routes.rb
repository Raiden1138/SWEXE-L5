Rails.application.routes.draw do
  get 'users/index'
  resources :users
  root 'users#index'
  
  get 'users/new', to: 'users#new'
  
  post 'users', to: 'users#create'
  
  delete 'bookmarks/:id', to: 'bookmarks#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
