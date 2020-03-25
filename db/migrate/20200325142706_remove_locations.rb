class RemoveLocations < ActiveRecord::Migration[6.0]
  def change
    drop_table :locations, &:timestamps
  end
end
