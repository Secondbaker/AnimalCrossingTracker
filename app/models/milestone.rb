class Milestone < ApplicationRecord
    has_many :milestone_values

    has_one :collectible, as: :collectible_attribute_value
end
