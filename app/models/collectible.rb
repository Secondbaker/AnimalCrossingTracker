class Collectible < ApplicationRecord
  belongs_to :collection
  has_many :collectible_attributes
  has_many :time_of_years
  has_many :time_of_days
end
