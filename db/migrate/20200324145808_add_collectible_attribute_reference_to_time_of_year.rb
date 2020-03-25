# frozen_string_literal: true

class AddCollectibleAttributeReferenceToTimeOfYear < ActiveRecord::Migration[6.0]
  def change
    add_reference :time_of_years, :collectible_attribute, foreign_key: true
  end
end
