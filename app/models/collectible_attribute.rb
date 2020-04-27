# frozen_string_literal: true

class CollectibleAttribute < ApplicationRecord
  belongs_to :collectible_attribute_container, polymorphic: true
  acts_as_list scope: :collectible_attribute_container
  belongs_to :collectible_attribute_type
  belongs_to :collectible_attribute_value, polymorphic: true
  accepts_nested_attributes_for :collectible_attribute_value

  def <=>(other)
    self.collectible_attribute_value <=> other.collectible_attribute_value
  end
end
