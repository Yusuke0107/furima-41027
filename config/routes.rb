Rails.application.routes.draw do
  devise_for :users
  get 'items/index'

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "items#index"
  resources :items, only: [:index, :new, :create]
  resources :articles
end
