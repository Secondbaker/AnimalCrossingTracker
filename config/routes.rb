# frozen_string_literal: true

Rails.application.routes.draw do
  resources :shadow_sizes
  resources :fish_sizes
  resources :timespans
  resources :bug_spots
  resources :fishing_spots
  resources :bug_locations
  resources :locations
  resources :fishing_locations
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
