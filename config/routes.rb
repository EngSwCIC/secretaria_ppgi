# frozen_string_literal: true

Rails.application.routes.draw do
  resources :accreditations
  resources :sei_processes

  resources :requirements do
    member do
      delete :delete_document_attachment
    end
  end

  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
