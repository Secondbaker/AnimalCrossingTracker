# frozen_string_literal: true

class TimeOfYear < ApplicationRecord
  include FilterableAttribute
  has_and_belongs_to_many :months
  def filters
    { current_month: "this month", specific_month: "a specific month" }
  end
end
