class CreateFishingSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :fishing_spots do |t|
      t.string :name

      t.timestamps
    end
  end
end
