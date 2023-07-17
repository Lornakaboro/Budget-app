# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  resources :users, only: %i[index show new] do
    resources :groups, only: %i[new create show index destroy]
    resources :entities, only: %i[new create index show destroy]
  end

  # Defines the root path route ("/")
  get 'logout', to: 'session#destroy', as: 'logout'
end
