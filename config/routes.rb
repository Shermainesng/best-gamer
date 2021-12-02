Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'coaches', to: 'users#index'

  get 'all_orders', to: "orders#index"

  get '/:username', to: "users#show"
  get '/:username/:date', to: "users#slots_date"

  resources :slots, only: [:show, :index] do
    resources :orders, only: [:new, :create, :show]
    resources :reviews, only: [:new, :create]
    get 'confirmed', to: 'orders#confirmed'
  end

  # get 'orders/:order_id/reviews/new', to: 'reviews#new', as: :review_new
  # post 'orders/:order_id/reviews', to: 'reviews#create'

end
