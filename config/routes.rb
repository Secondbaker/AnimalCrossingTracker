Rails.application.routes.draw do
  resources :collectible_attributes
  resources :collectibles
  resources :collections
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
