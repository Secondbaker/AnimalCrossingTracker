class CreateTimeOfYears < ActiveRecord::Migration[6.0]
  def change
    create_table :time_of_years do |t|
      t.integer :start
      t.integer :end

      t.timestamps
    end
  end
end
