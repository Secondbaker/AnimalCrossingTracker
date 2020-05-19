class AddLabelsToAllCollectibleAttributes < ActiveRecord::Migration[6.0]
  def change
    add_column :bell_values, :label, :string, default: 'Value'
    add_column :birthdays, :label, :string, default: 'Birthday'
    add_column :bug_locations, :label, :string, default: 'Location'
    remove_column :bug_locations, :name, :string
    add_column :collectible_attribute_lists, :label, :string
    add_column :fishing_locations, :label, :string, default: 'Location'
    remove_column :fishing_locations, :name, :string
    add_column :number_collectible_attributes, :label, :string
    add_column :shadow_sizes, :label, :string, default: 'Shadow Size'
    add_column :time_of_days, :label, :string, default: 'Active Hours'
    add_column :time_of_years, :label, :string, default: 'Seasonality'
    add_column :villager_genders, :label, :string, default: 'Gender'
  end
end
