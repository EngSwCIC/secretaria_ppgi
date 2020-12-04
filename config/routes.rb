# frozen_string_literal: true

Rails.application.routes.draw do
  resources :request_deadlines
  resources :tickets
  resources :diaria
  resources :budgets, only: [:new, :index, :create]
  resources :requirements, only: [:new, :index, :create]
  resources :requests
  resources :request_types
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
