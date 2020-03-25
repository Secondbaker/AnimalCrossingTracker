# frozen_string_literal: true

class Collection < ApplicationRecord
  has_many :collectibles

  accepts_nested_attributes_for :collectibles
end
