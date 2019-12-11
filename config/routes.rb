# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :activities do
    member do
      get :toggle_interest
      get :add_interested
    end
    collection do
      get :index_interests
      get :reset_interests
    end
  end
end
