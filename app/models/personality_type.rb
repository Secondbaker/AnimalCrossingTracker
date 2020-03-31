class PersonalityType < ApplicationRecord
    has_and_belongs_to_many :villager_personalities
end
