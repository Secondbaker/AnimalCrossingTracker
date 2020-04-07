class AddValueToMilestoneValues < ActiveRecord::Migration[6.0]
  def change
    add_column :milestone_values, :value, :integer
  end
end
