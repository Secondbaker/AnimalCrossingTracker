class CreateVillagerPersonalities < ActiveRecord::Migration[6.0]
  def change
    create_table :villager_personalities do |t|

      t.timestamps
    end
  end
end
