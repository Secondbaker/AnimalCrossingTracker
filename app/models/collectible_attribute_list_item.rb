class CollectibleAttributeListItem < ApplicationRecord
  belongs_to :collectible_attribute_list
  has_one :collectible_attribute, as: :collectible_attribute_value
  acts_as_list scope: :collectible_attribute_list
end
