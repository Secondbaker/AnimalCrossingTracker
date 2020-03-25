# frozen_string_literal: true

class AddPositionToCollectibleAttribute < ActiveRecord::Migration[6.0]
  def change
    add_column :collectible_attributes, :position, :integer
  end
end
