class AddReferenceBetweenLocationAndFishingLocation < ActiveRecord::Migration[6.0]
  def change
    add_reference :locations, :location_value, polymorphic: true, index: {name: "location_value_index"}
  end
end
