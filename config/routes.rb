Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :books
  resources :users, only: [:show]

  root to: 'books#index'
end
