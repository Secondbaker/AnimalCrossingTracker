# frozen_string_literal: true

class CreateRarities < ActiveRecord::Migration[6.0]
  def change
    create_table :rarities do |t|
      t.integer :value
      t.references :collectible, null: false, foreign_key: true

      t.timestamps
    end
  end
end
