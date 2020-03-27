class CreateJoinTableMoodMoodName < ActiveRecord::Migration[6.0]
  def change
    create_join_table :moods, :mood_names do |t|
      # t.index [:mood_id, :mood_name_id]
      # t.index [:mood_name_id, :mood_id]
    end
  end
end
