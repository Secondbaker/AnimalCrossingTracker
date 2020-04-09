class CreateRewardTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :reward_titles do |t|

      t.timestamps
    end
  end
end
