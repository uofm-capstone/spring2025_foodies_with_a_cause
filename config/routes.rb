Rails.application.routes.draw do
  devise_for :user_distributors
  devise_for :user_markets
  devise_for :user_farmers
  
  root to: redirect('/home')
  get 'home', to: 'pages#home', as: 'home'

  get 'products', to: 'products#index', as: 'products'
  post 'products', to: 'products#create'
  get 'products/new', to: 'products#new', as: 'new_product'
  get 'products/:id', to: 'products#show', as: 'product'


end
