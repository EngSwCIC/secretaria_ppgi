# frozen_string_literal: true

Rails.application.routes.draw do
  resources :wiki_entries do
    resources :comments, controller:"wiki_comments", shallow:true
    resources :wiki_comments, shallow:true
  end
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
