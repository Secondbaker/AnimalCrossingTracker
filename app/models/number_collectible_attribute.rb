class NumberCollectibleAttribute < ApplicationRecord
    has_one collectible_attribute:, as: :collectible_attribute_value
end
