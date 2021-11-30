Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'coaches/:game', to: 'users#index'

  get 'coaches/:game/:username', to: 'users#show'

  resources :slots, only: [:show] do
    resources :orders, only: [:new, :create, :show]

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
