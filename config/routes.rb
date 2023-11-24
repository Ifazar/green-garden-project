# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create edit show]
  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#index'
  resources :pages

  resources :gardens do
    resources :reservations do
      member do
        patch 'validate'
      end
    end
  end
end
