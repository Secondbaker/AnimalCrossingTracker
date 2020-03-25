# frozen_string_literal: true

class Rarity < ApplicationRecord
  has_one :collectible_attribute, as: :collectible_attribute_value
  validates :value, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
