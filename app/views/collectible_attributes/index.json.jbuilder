# frozen_string_literal: true

json.array! @collectible_attributes, partial: 'collectible_attributes/collectible_attribute', as: :collectible_attribute
