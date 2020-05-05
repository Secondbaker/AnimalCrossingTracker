# frozen_string_literal: true

class TimeOfYear < ApplicationRecord
  include FilterableAttribute
  has_and_belongs_to_many :months
  def filters
    { current_month: "this month", months: { january: "January", february: "February", march: "March", april: "April", may: "May", june: "June", july: "July", august: "August", september: "September", october: "October", november: "November", december: "December" } }
  end
end
