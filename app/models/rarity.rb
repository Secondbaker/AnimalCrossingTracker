class Rarity < ApplicationRecord
  belongs_to :collectible
  validates :value, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
end
