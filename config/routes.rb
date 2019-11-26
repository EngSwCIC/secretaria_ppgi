Rails.application.routes.draw do
  resources :attendances
  get '/search' => 'attendances#search', :as => 'search_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
