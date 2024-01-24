Rails.application.routes.draw do
  devise_for :users
  resources :passes
  root to: 'passes#index'
end
