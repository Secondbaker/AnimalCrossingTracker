class RemoveStartAndEndFromTimeOfDay < ActiveRecord::Migration[6.0]
  def change
    remove_column :time_of_days, :start, :string
    remove_column :time_of_days, :end, :string
  end
end
