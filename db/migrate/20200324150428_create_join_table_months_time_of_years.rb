# frozen_string_literal: true

class CreateJoinTableMonthsTimeOfYears < ActiveRecord::Migration[6.0]
  def change
    create_join_table :months, :time_of_years do |t|
      # t.index [:month_id, :time_of_year_id]
      # t.index [:time_of_year_id, :month_id]
    end
  end
end
