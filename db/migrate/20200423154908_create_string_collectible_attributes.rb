class CreateStringCollectibleAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :string_collectible_attributes do |t|
      t.string :value

      t.timestamps
    end
  end
end
