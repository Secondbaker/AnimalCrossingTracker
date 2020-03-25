# frozen_string_literal: true

class Location < ApplicationRecord
  has_one :collectible_attribute, as: :collectible_attribute_value
  belongs_to :location_value, polymorphic: true
end
