# frozen_string_literal: true

class BugLocation < ApplicationRecord
  has_and_belongs_to_many :bug_spots
end
