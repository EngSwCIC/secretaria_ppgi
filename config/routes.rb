# frozen_string_literal: true

Rails.application.routes.draw do

  get 'process/:id', to: 'process#show', as: :process_show
  get 'process', to: 'process#index', as: :process_home
  post 'process', to: 'process#create', as: :process_creation
  delete 'process/:id', to: 'process#destroy', as: :process_delete
  get 'search', to: 'process#search', as: :process_search
  get 'process/:id/:doc_id', to: 'process#serve', as: :process_download
  post 'process/:id', to: 'process#attach', as: :process_attach

  get 'processstatus/:id', to: 'processstatus#show', as: :processstatus_show
  post 'processstatus', to: 'processstatus#create', as: :processstatus_creation
  delete 'processstatus/:id', to: 'processstatus#destroy', as: :processstatus_delete

  get  'home/index', :home
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
