Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'coaches/:game', to: 'users#filter_by_game', as: 'users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
