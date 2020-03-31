class CreateVillagerGenders < ActiveRecord::Migration[6.0]
  def change
    create_table :villager_genders do |t|
      t.integer :value, :limit => 1

      t.timestamps
    end
  end
end
