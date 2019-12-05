# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :activities
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  # Rotas p processo
  get     "/processos",               to: "activities#index"
  get     "/processo/new",            to: "activities#new"
  get     "/processo/:id",            to: "activities#show"
  post    "/processo/cadastro",       to: "activities#create"
  put     "/processo/:id/atualizar",  to: "activities#update"
  delete  "/processo/:id/excluir",    to: "activities#delete"  
end
