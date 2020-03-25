# frozen_string_literal: true

class CreateCollectibleAttributeTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :collectible_attribute_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
