Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Devise for User Authentication
  devise_for :users

  # Root and Static Pages
  root to: redirect('/home')
  get 'home', to: 'home#home', as: 'home'
  get 'about', to: 'static_pages#about', as: 'about'
  get 'services', to: 'pages#services', as: 'services'
  get 'contact', to: 'pages#contact', as: 'contact'
  get 'how_it_works', to: 'steps#how_it_works', as: 'how_it_works'

  # Privacy and Terms
  get 'privacy', to: 'pages#privacy', as: 'privacy'
  get 'terms', to: 'pages#terms', as: 'terms'

  # User Routes
  resources :users, only: [:index, :show, :edit, :update] do
    # Messaging Routes Nested Under Users
    resources :messages, only: [:index, :create]
    # Notifications Nested Under Users
    resources :notifications, only: [:index, :show], controller: 'user_notifications'
  end

  # Inbox Route for Messages
  get 'messages', to: 'messages#inbox', as: 'inbox'

  # Product Routes
  resources :products, only: [:index, :show, :new, :create, :destroy]
  
  # Stripe Routes
  get 'stripe_test/connection_test'
  # stripe listen --forward-to localhost:3000/stripe/webhooks
  post 'stripe/webhooks', to: 'stripe/webhooks#create'
end
