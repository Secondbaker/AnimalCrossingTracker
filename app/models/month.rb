class Month < ApplicationRecord
    has_and_belongs_to_many :time_of_years
end
