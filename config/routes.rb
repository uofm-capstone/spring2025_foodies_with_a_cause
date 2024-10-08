Rails.application.routes.draw do

  root 'home#home'
  get 'about', to: 'pages#about'
  get 'services', to: 'pages#services'
  get 'contact', to: 'pages#contact'
  get 'signup', to: 'users#new'

  get 'privacy', to: 'pages#privacy', as: 'privacy'
  get 'terms', to: 'pages#terms', as: 'terms'

end



