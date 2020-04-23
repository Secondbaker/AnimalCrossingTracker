class RemoveTimespans < ActiveRecord::Migration[6.0]
  def up
    drop_table :timespans
  end

  def down
    create_table :timespans do |t|
      t.time :start
      t.time :end
      
      t.timestamps
    end
    add_reference :timespans, :time_of_day, foreign_key: true
  end
end
