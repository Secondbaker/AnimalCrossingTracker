# frozen_string_literal: true

class CreateTimeOfYears < ActiveRecord::Migration[6.0]
  def change
    create_table :time_of_years, &:timestamps
  end
end
