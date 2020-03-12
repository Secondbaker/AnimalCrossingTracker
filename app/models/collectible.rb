class Collectible < ApplicationRecord
  belongs_to :collection
  has_many :collectible_attributes
end
