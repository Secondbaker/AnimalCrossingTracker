# frozen_string_literal: true

class CollectibleAttribute < ApplicationRecord
  include FilterableAttribute, Comparable
  belongs_to :collectible_attribute_container, polymorphic: true
  acts_as_list scope: :collectible_attribute_container
  belongs_to :collectible_attribute_type
  belongs_to :collectible_attribute_value, polymorphic: true
  accepts_nested_attributes_for :collectible_attribute_value

  def <=>(other)
    if other.class != CollectibleAttribute
      return nil
    end
    self.collectible_attribute_value <=> other.collectible_attribute_value
  end

  def is_filterable
    filterable_value = false
    if self.collectible_attribute_value.class < FilterableAttribute
      filterable_value = true
    end
    return filterable_value
  end
end
