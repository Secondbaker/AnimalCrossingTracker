class CreateHours < ActiveRecord::Migration[6.0]
  def change
    create_table :hours do |t|
      t.string :name

      t.timestamps
    end
  end
end
