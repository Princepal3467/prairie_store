Rails.application.routes.draw do
  get "categories/show"
  root "products#index"

  get "about", to: "pages#about"

  resources :products, only: [:index, :show]
  resources :orders, only: [:index]
  post "add_to_cart/:id", to: "orders#add_to_cart", as: "add_to_cart"

  get "categories/:id", to: "categories#show", as: "category"

  namespace :admin do
    get "/", to: "dashboard#index", as: "dashboard"
    resources :products
    resources :categories
  end
end