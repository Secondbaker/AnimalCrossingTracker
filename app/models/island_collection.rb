class IslandCollection < ApplicationRecord
    extend FriendlyId

    does 'frozen_attribute', :default

    has_and_belongs_to_many :users

    has_many :collectibles

    accepts_nested_attributes_for :collectibles

    friendly_id :title, use: :slugged
end
