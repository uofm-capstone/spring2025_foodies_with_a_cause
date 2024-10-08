Rails.application.routes.draw do

  devise_for :user_distributors
  devise_for :user_markets
  devise_for :user_farmers
  
  root 'home#home'
  get 'about', to: 'pages#about'
  get 'services', to: 'pages#services'
  get 'contact', to: 'pages#contact'
  get 'signup', to: 'users#new'

  get 'privacy', to: 'pages#privacy', as: 'privacy'
  get 'terms', to: 'pages#terms', as: 'terms'
  get 'products', to: 'products#index', as: 'products'
  post 'products', to: 'products#create'
  get 'products/new', to: 'products#new', as: 'new_product'
  get 'products/:id', to: 'products#show', as: 'product'

>>>>>>> main

end



