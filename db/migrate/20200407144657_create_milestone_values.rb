class CreateMilestoneValues < ActiveRecord::Migration[6.0]
  def change
    create_table :milestone_values do |t|
      t.references :milestone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
