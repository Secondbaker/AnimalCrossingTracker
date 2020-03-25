# frozen_string_literal: true

class AddNameToBugLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :bug_locations, :name, :string
  end
end
