# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :activities
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  # Rotas p processo
  get     "/processos",                to: "activities#index"
  get     "/processos/new",            to: "activities#new"
  get     "/processos/:id",            to: "activities#show", as: 'activity'
  post    "/processos/cadastro",       to: "activities#create"
  put     "/processos/:id/atualizar",  to: "activities#update", as: 'editar'
  delete  "/processos/:id/excluir",    to: "activities#delete"  
end
