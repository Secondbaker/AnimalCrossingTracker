class RemoveLabelsFromCollectibleAttributeValues < ActiveRecord::Migration[6.0]
  def change
    remove_column :bell_values, :label, :string, default: 'Value'
    remove_column :birthdays, :label, :string, default: 'Birthday'
    remove_column :bug_locations, :label, :string, default: 'Location'
    remove_column :collectible_attribute_lists, :label, :string
    remove_column :fishing_locations, :label, :string, default: 'Location'
    remove_column :number_collectible_attributes, :label, :string
    remove_column :shadow_sizes, :label, :string, default: 'Shadow Size'
    remove_column :time_of_days, :label, :string, default: 'Active Hours'
    remove_column :time_of_years, :label, :string, default: 'Seasonality'
    remove_column :villager_genders, :label, :string, default: 'Gender'
  end
end
