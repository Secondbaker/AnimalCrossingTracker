# frozen_string_literal: true

json.extract! collectible_attribute, :id, :collectible_attribute_value_type, :collectible_id, :created_at, :updated_at

json.collectible_attribute_value do
    value = collectible_attribute.collectible_attribute_value
    if(value.class == BellValue)
        json.partial! 'bell_values/bell_value', bell_value:value
    else
        ""
    end
end

json.url collectible_attribute_url(collectible_attribute, format: :json)
