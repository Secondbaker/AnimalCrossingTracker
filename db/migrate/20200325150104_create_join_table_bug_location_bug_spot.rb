class CreateJoinTableBugLocationBugSpot < ActiveRecord::Migration[6.0]
  def change
    create_join_table :bug_locations, :bug_spots do |t|
      # t.index [:bug_location_id, :bug_spot_id]
      # t.index [:bug_spot_id, :bug_location_id]
    end
  end
end
