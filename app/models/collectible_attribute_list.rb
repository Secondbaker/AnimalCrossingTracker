class CollectibleAttributeList < ApplicationRecord
    has_one :collectible_attribute, as: :collectible_attribute_value
    has_many :collectible_attribute_list_items
end
