class CreateFishingLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :fishing_locations do |t|
      t.string :name

      t.timestamps
    end
  end
end
