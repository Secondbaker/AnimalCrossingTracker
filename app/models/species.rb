class Species < ApplicationRecord
    has_and_belongs_to_many :villager_species
end
