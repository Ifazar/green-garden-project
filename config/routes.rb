Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :edit, :update, :show]
  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#index'
  resources :pages

  resources :gardens do
    resources :reservations do
      member do
        patch 'confirme'
        patch 'refuse'
      end
    end
  end

end
