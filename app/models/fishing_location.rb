# frozen_string_literal: true

class FishingLocation < ApplicationRecord
  has_and_belongs_to_many :fishing_spots
end
