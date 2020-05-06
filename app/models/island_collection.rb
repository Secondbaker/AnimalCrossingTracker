class IslandCollection < ApplicationRecord
    extend FriendlyId

    has_many :collectibles

    accepts_nested_attributes_for :collectibles

    friendly_id :title, use: :slugged
end
