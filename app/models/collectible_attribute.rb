# frozen_string_literal: true

class CollectibleAttribute < ApplicationRecord
  belongs_to :collectible
  acts_as_list scope: :collectible
  belongs_to :collectible_attribute_type
  belongs_to :collectible_attribute_value, polymorphic: true
  accepts_nested_attributes_for :collectible_attribute_value
end
