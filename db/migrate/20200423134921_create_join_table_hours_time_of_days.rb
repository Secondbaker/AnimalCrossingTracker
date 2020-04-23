class CreateJoinTableHoursTimeOfDays < ActiveRecord::Migration[6.0]
  def change
    create_join_table :hours, :time_of_days do |t|
      # t.index [:hour_id, :time_of_day_id]
      # t.index [:time_of_day_id, :hour_id]
    end
  end
end
