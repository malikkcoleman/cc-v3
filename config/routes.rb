Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  get "/shop", to: "categories#index"
  get "/shop/:id", to: "categories#show"
  get "product/:id", to: "products#index"
  get "/search", to: "categories#search"

  resources :cart, only: %i[create destroy]
end
