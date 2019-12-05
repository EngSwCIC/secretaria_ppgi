# frozen_string_literal: true

Rails.application.routes.draw do
  resources :announcements
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  devise_for :users

  resources :setups 
  resources :solicitations do 
    member do 
      get "accept"
      get "refuse"
    end
  end
  resources :requirements
  get 'home/index'
end