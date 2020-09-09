Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :books
  resources :reports
  resources :comments
  resources :users, only: [:show]
end
