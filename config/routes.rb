Rails.application.routes.draw do
  resources :passes
  root to: 'passes#index'
end
