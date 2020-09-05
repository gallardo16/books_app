Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :books
  resources :users, only: [:index, :show] do
    resource :friendships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
end
