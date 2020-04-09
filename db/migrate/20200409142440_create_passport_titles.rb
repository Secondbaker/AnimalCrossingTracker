class CreatePassportTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :passport_titles do |t|
      t.string :value

      t.timestamps
    end
  end
end
