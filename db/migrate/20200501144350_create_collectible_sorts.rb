class CreateCollectibleSorts < ActiveRecord::Migration[6.0]
  def change
    create_table :collectible_sorts do |t|
      t.string :name
      t.string :keyword
      t.string :collectible_attribute_class_name

      t.timestamps
    end
  end
end
