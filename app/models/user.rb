class User < ApplicationRecord
    has_many :my_collected_collectibles
    has_many :collectibles, through: :my_collected_collectibles
    has_and_belongs_to_many :island_collections
end
