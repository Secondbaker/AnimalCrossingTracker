class CreateJoinTableFishingLocationsFishingSpots < ActiveRecord::Migration[6.0]
  def change
    create_join_table :fishing_locations, :fishing_spots do |t|
      # t.index [:fishing_location_id, :fishing_spot_id]
      # t.index [:fishing_spot_id, :fishing_location_id]
    end
  end
end
