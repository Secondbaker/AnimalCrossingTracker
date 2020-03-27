class CreateMoodNames < ActiveRecord::Migration[6.0]
  def change
    create_table :mood_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
