Rails.application.routes.draw do
  get 'steps/how_it_works'
  get 'static_pages/about'
  devise_for :users
  


  # root 'home#home'
  root to: redirect('/home')
  get 'home', to: 'home#home', as: 'home'
  get 'about', to: 'static_pages#about'
  get 'services', to: 'pages#services'
  get 'contact', to: 'pages#contact'

  get 'how_it_works', to: 'steps#how_it_works'

  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'

  get 'privacy', to: 'pages#privacy', as: 'privacy'
  get 'terms', to: 'pages#terms', as: 'terms'
  get 'products', to: 'products#index', as: 'products'
  post 'products', to: 'products#create'
  get 'products/new', to: 'products#new', as: 'new_product'
  get 'products/:id', to: 'products#show', as: 'product'



end
