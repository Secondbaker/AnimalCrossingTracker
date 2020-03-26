class FishSize < ApplicationRecord
    has_and_belongs_to_many :shadow_sizes
end
