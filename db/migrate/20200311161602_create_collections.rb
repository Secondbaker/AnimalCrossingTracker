# frozen_string_literal: true

class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.string :title

      t.timestamps
    end
  end
end
