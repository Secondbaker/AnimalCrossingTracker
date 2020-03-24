class TimeOfYear < ApplicationRecord
  has_and_belongs_to_many :months
end
