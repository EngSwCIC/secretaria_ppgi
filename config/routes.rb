# frozen_string_literal: true

Rails.application.routes.draw do

  get 'process', to: 'process#index', as: :process_home
  get 'process/:id', to: 'process#show', as: :process_show
  post 'process', to: 'process#create', as: :process_creation
  delete 'process/:id', to: 'process#destroy', as: :process_delete
  get 'search', to: 'process#search', as: :process_search

  get 'home/index', :home
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
