Rails.application.routes.draw do
  devise_for :users
  get 'cows/index'
  root to: "cows#index"
end
