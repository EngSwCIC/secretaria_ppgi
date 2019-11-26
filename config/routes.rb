Rails.application.routes.draw do
  resources :attendances do
    member do
      delete :delete_file_attachment
    end
  end
  get '/search' => 'attendances#search', :as => 'search_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
