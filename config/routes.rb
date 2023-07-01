Rails.application.routes.draw do
  devise_for :users
  root to: "cows#index"
  resources :users, only: [:edit, :update]
  resources :cows
  resources :feeds, only: [:index, :new, :create, :show, :edit, :update]
end
