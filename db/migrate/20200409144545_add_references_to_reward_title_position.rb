class AddReferencesToRewardTitlePosition < ActiveRecord::Migration[6.0]
  def change
    add_reference :reward_title_positions, :reward_title, foreign_key: true
    add_reference :reward_title_positions, :passport_title, foreign_key: true
  end
end
