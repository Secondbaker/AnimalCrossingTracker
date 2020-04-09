class CreateRewardTitlePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :reward_title_positions do |t|

      t.timestamps
    end
  end
end
