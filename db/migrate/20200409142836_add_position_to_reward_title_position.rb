class AddPositionToRewardTitlePosition < ActiveRecord::Migration[6.0]
  def change
    add_column :reward_title_positions, :position, :integer
  end
end
