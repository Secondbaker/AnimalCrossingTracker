class AddReferenceToTimespan < ActiveRecord::Migration[6.0]
  def change
    add_reference :timespans, :time_of_day, foreign_key: true
  end
end
