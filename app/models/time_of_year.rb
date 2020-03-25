# frozen_string_literal: true

class TimeOfYear < ApplicationRecord
  has_and_belongs_to_many :months
end
