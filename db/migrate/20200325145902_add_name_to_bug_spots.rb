class AddNameToBugSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :bug_spots, :name, :string
  end
end
