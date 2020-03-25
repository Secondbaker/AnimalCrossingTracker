# frozen_string_literal: true

class CreateBugLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :bug_locations, &:timestamps
  end
end
