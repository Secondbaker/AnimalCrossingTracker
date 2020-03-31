class ChangePersonalityTypeValueToName < ActiveRecord::Migration[6.0]
  def change
    remove_column :personality_types, :value, :string
    add_column :personality_types, :name, :string
  end
end
