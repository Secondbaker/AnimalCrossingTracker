class CreateFishSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :fish_sizes do |t|
      t.string :name

      t.timestamps
    end
  end
end
