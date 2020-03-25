class CreateBugSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :bug_spots do |t|

      t.timestamps
    end
  end
end
