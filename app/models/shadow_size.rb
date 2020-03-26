class ShadowSize < ApplicationRecord
  has_one :collectible_attribute, as: :collectible_attribute_value
  has_and_belongs_to_many :fish_sizes
end
