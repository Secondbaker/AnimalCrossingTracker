# frozen_string_literal: true

class Collectible < ApplicationRecord
  belongs_to :collection
  has_many :collectible_attributes, -> { order(position: :asc) }
  accepts_nested_attributes_for :collectible_attributes
end
