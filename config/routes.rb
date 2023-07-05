Rails.application.routes.draw do
  devise_for :users
  root to: "cows#index"
  resources :users, only: [:edit, :update]
  resources :cows do
    resources :cow_feeds
  end
  resources :feeds
end
