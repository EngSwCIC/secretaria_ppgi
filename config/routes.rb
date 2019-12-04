# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  get 'credenciamento' => 'credenciamento#show_form'
  get 'credenciamento/show_status' => 'credenciamento#show_status'
  get 'credenciamento/show_pedidos' => 'credenciamento#show_pedidos'
  get 'credenciamento/show_recredenciamento' => 'credenciamento#show_recredenciamento'
  get 'credenciamento/aproved' => 'credenciamento#aproved'
  get 'credenciamento/rejected' => 'credenciamento#rejected'
  post 'credenciamento/create_credenciamento' => 'credenciamento#create_credenciamento'
  post 'credenciamento/alter_credenciamento' => 'credenciamento#alter_credenciamento'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
