Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :orders, only: [:new, :create]

  get 'coaches/:game', to: 'users#index'

  # get 'coaches/:id/', to: 'users#filter'
  # get 'coaches/:id', to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
