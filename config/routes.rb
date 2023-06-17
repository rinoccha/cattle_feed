Rails.application.routes.draw do
  devise_for :installs
  get 'cows/index'
  root to: "cows#index"
end
