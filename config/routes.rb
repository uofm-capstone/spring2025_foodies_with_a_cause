Rails.application.routes.draw do
  devise_for :user_distributors
  devise_for :user_markets
  devise_for :user_farmers
  
  get 'home', to: 'pages#home', as: 'home'


end
