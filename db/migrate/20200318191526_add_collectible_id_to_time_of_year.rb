# frozen_string_literal: true

class AddCollectibleIdToTimeOfYear < ActiveRecord::Migration[6.0]
  def change
    add_reference :time_of_years, :collectible, foreign_key: true
  end
end
