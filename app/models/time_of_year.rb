class TimeOfYear < ApplicationRecord
    belongs_to :collectible
    validates :start, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
    validates :end, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }

end
