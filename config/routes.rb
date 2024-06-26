# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users

  resources :passes do
    get :change_status, on: :member
    get :only_created,  on: :collection
  end

  # get '/passes/:id/change_status', to: 'passes#change_status', as: 'change_pass_status'

  root to: 'passes#index'

  resources :users
  resources :roles
end
