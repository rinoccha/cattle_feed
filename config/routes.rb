Rails.application.routes.draw do
  get 'cows/index'
  root to: "cows#index"
end
