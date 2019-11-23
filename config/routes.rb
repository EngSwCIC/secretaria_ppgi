# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  # Rotas p Processos
  get     "/processos",               to: "processos#index"
  get     "/processos/:id",           to: "processos#show"
  post    "/processos/cadastro",      to: "processos#create"
  put     "/processos/:id/atualizar", to: "processos#update"
  delete  "/processos/:id/excluir",   to: "processos#delete"  
end
