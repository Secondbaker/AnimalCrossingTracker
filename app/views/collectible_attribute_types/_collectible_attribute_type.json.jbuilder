# frozen_string_literal: true

json.extract! collectible_attribute_type, :id, :name, :created_at, :updated_at
json.url collectible_attribute_type_url(collectible_attribute_type, format: :json)
