Rails.application.routes.draw do
  resources :reports
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :books
  resources :users, only: [:show]
end
