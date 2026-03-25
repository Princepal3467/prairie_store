Rails.application.routes.draw do
  root "products#index"

  get "about", to: "pages#about"

  resources :products
  resources :orders

  post "add_to_cart/:id", to: "orders#add_to_cart", as: "add_to_cart"
end