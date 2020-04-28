# frozen_string_literal: true

json.extract! collectible, :id, :name, :complete, :island_collection_id, :created_at, :updated_at
json.url collectible_url(collectible, format: :json)

json.collectible_attributes(collectible.collectible_attributes) do |collectible_attribute|
    json.partial! 'collectible_attributes/collectible_attribute', collectible_attribute:collectible_attribute
end
