Rails.application.routes.draw do
  devise_for :users
  root to: 'passes#index'
  resources :passes
  resources :users
end
