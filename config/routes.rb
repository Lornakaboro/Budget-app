Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  resources :users, only: [:index, :show, :new] do
    resources :groups, only: [:new, :create, :show, :index, :destroy]
    resources :entities, only: [:new, :create, :index, :show, :destroy]
  end

  # Defines the root path route ("/")
  get 'logout', to: 'session#destroy', as: 'logout'
end
