Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :books do
    resources :comments
  end

  resources :reports do
    resources :comments
  end

  resources :users, only: [:index, :show] do
    resource :friendships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    resources :books, only: [:index, :show], module: 'users'
  end
end
