Rails.application.routes.draw do
  resources :time_of_years
  resources :collectible_attribute_types
  resources :months
  resources :bell_values
  resources :rarities
  resources :time_of_days
  resources :collectible_attributes
  resources :collectibles
  resources :collections
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
