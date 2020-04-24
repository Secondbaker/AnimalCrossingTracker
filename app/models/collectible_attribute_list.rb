class CollectibleAttributeList < ApplicationRecord
    has_one :collectible_attribute, as: :collectible_attribute_value
    has_many :collectible_attributes, -> { order(position: :asc) }, as: :collectible_attribute_container
end
