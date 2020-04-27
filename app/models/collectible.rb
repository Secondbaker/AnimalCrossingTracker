# frozen_string_literal: true

class Collectible < ApplicationRecord
  belongs_to :island_collection
  has_many :collectible_attributes, -> { order(position: :asc) }, as: :collectible_attribute_container
  accepts_nested_attributes_for :collectible_attributes
  acts_as_list scope: :island_collection
end
