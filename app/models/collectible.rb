class Collectible < ApplicationRecord
  belongs_to :collection
  has_many :collectible_attributes
  has_many :time_of_years
end
