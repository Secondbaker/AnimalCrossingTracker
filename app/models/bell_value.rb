class BellValue < ApplicationRecord
  belongs_to :collectible
  validates :value, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 2000000}
end
