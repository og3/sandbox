Rails.application.routes.draw do
  get 'pages/show'

  devise_for :users
  root 'pages#index'
  resources :users, only: [:index]
end
