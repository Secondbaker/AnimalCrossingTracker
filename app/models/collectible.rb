# frozen_string_literal: true

class Collectible < ApplicationRecord
  belongs_to :island_collection
  has_many :my_collected_collectibles
  has_many :users, through: :my_collected_collectibles

  has_many :collectible_attributes, -> { order(position: :asc) }, as: :collectible_attribute_container
  accepts_nested_attributes_for :collectible_attributes
  acts_as_list scope: :island_collection

  def active_in(month: string)
    result = false
    
    self.collectible_attributes.each do |collectible_attribute|
      if collectible_attribute.collectible_attribute_value.class == TimeOfYear && collectible_attribute.collectible_attribute_value.months.find_by(name: month)
        result = true
      end
    end

    return result
  end

  def active_at_time(time: Time)
    result = false

    self.collectible_attributes.each do |collectible_attribute|
      if collectible_attribute.collectible_attribute_value.class == TimeOfDay && collectible_attribute.collectible_attribute_value.active_at_time(time: time)
        result = true
      end
    end

    return result
  end
end
