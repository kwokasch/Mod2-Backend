Rails.application.routes.draw do
  resources :playlists
  resources :albums, only: [:index, :show, :create]
  resources :artists, only: [:index, :show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
