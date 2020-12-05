# frozen_string_literal: true

Rails.application.routes.draw do

  get 'process', to: 'process#index', as: :process_home
  post 'process', to: 'process#create', as: 'process_creation'
  delete 'process/:id', to: 'process#destroy', as: 'process_delete'

  get 'home/index', :home
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
