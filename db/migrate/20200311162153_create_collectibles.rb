# frozen_string_literal: true

class CreateCollectibles < ActiveRecord::Migration[6.0]
  def change
    create_table :collectibles do |t|
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
