Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'toppages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  # get 'logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'
  
  # root to: "toppages#login"
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create]
  resources :tasks
end
