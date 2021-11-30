Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  post 'coaches/:id', to: 'users#filter_by_game'
  # get 'coaches/:id/', to: 'users#filter'
  # get 'coaches/:id', to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
