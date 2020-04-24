# frozen_string_literal: true

Rails.application.routes.draw do
  resources :collectible_attribute_list_items
  resources :collectible_attribute_lists
  resources :string_collectible_attributes
  resources :hours
  resources :passport_titles
  resources :reward_title_positions
  resources :reward_titles
  resources :milestone_values
  resources :milestones
  get 'welcome/index'
  resources :island_collections
  resources :descriptions
  resources :villager_catchphrases
  resources :catchphrases
  resources :birthdays
  resources :villager_species
  resources :species
  resources :personality_types
  resources :villager_personalities
  resources :villager_genders
  resources :mood_names
  resources :moods
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
  resources :collectibles do
    patch "/toggle", :to => "collectibles#toggle", :as => "toggle"
  end
  resources :collections
  root 'welcome#index'

  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'

  get '/logout' => 'logout#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
