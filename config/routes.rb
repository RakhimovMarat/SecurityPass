# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :passes do
    member do
      patch :change_status
    end
  end
  get '/passes/:id/change_status', to: 'passes#change_status', as: 'change_pass_status'
  root to: 'passes#index'

  resources :users
  resources :roles
end
