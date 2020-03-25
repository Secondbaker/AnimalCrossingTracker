# frozen_string_literal: true

class FishingLocation < ApplicationRecord
  has_many :locations, as: :location_value
end
