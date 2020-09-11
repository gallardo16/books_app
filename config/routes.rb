Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :books do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :reports do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :users, only: [:index, :show] do
    resource :friendships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    resources :books, only: :index, module: 'users'
  end
end
