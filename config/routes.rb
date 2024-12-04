Rails.application.routes.draw do
  get 'steps/how_it_works'
  get 'static_pages/about'
  devise_for :users

  # Root and Static Pages
  root to: redirect('/home')
  get 'home', to: 'home#home', as: 'home'
  get 'about', to: 'static_pages#about'
  get 'services', to: 'pages#services'
  get 'contact', to: 'pages#contact'
  get 'how_it_works', to: 'steps#how_it_works'

  # User Routes
  resources :users, only: [:index, :show, :edit, :update]
  
  # Messaging Routes
# Messaging Routes
get 'users/:user_id/messages', to: 'messages#index', as: 'user_messages'
post 'users/:user_id/messages', to: 'messages#create'

# Inbox Route
get 'messages', to: 'messages#inbox', as: 'inbox'

  # Policies
  get 'privacy', to: 'pages#privacy', as: 'privacy'
  get 'terms', to: 'pages#terms', as: 'terms'

  # Product Routes
  resources :products, only: [:index, :show, :new, :create, :destroy]

  resources :users do
    resources :notifications, only: [:index, :show], controller: 'user_notifications'
  end
  



end
