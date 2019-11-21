Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  devise_for :controllers
  resources :activities
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home' => 'home#index'
  
end