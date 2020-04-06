class IslandCollection < ApplicationRecord
    has_many :collectibles

    accepts_nested_attributes_for :collectibles
end
