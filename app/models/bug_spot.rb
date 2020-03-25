class BugSpot < ApplicationRecord
    has_and_belongs_to_many :bug_locations
end
