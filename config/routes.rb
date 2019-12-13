# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  # Rotas p Processos
  get     "/processo",               to: "activities#index"
  get     "/processo/:id",           to: "activities#show" 
  post    "/processo/cadastro",      to: "activities#create"
  put     "/processo/:id/atualizar", to: "activities#update"
  delete  "/processo/:id/excluir",   to: "activities#delete"  
  
  get     "/status",                to: "status#index"
  get     "/status/:id",            to: "status#show"
  post    "/status/cadastro",       to: "status#create"
  put     "/status/:id/atualizar",  to: "status#update"
  delete  "/status/:id/excluir",    to: "status#delete"  
  
  get     "/processo/status/:status_id",   to: "activities#showthis"     
end
