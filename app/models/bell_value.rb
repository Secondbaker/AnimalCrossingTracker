class BellValue < ApplicationRecord
  has_one :collectible_attribute, as: :collectible_attribute_value
  validates :value, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 2000000}
end
