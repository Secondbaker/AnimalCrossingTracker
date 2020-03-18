class CreateTimeOfDays < ActiveRecord::Migration[6.0]
  def change
    create_table :time_of_days do |t|
      t.references :collectible, null: false, foreign_key: true
      t.time :start
      t.time :end

      t.timestamps
    end
  end
end
