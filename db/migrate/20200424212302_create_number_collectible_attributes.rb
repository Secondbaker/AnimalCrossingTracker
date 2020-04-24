class CreateNumberCollectibleAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :number_collectible_attributes do |t|
      t.integer :value

      t.timestamps
    end
  end
end
