json.extract! collectible_filter, :id, :name, :keyword, :collectible_attribute_class_name, :created_at, :updated_at
json.url collectible_filter_url(collectible_filter, format: :json)
