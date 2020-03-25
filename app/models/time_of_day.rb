# frozen_string_literal: true

class TimeOfDay < ApplicationRecord
  has_one :collectible_attribute, as: :collectible_attribute_value
  has_many :timespans
end
