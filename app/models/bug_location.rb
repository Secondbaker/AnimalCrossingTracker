# frozen_string_literal: true

class BugLocation < ApplicationRecord
  has_many :locations, as: :location_value
end
