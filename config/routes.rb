Rails.application.routes.draw do
  devise_for :users
  root to: "cows#index"
  resources :users, only: [:edit, :update]
  resources :cows do
    resources :cow_feeds
    get 'feeds', on: :member, defaults: { format: 'json' }
    get 'memo', on: :member, defaults: { format: 'json' }
    patch :update_order, on: :collection
  end
  resources :feeds

  patch 'cow/update_order', to: 'cows#update_order'

end
