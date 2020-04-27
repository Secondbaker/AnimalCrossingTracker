# frozen_string_literal: true

class BellValue < ApplicationRecord
  include Comparable
  has_one :collectible_attribute, as: :collectible_attribute_value
  validates :value, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 2_000_000 }

  def <=>(other)
    self.value <=> other.value
  end
end
