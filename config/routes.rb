##
# Routes

Rails.application.routes.draw do
  resources :notifications
  resources :sources
  resources :information
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
