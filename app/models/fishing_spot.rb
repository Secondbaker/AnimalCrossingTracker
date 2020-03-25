class FishingSpot < ApplicationRecord
    has_and_belongs_to_many :fishing_locations
end
