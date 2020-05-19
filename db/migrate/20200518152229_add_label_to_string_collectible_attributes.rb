class AddLabelToStringCollectibleAttributes < ActiveRecord::Migration[6.0]
  
  def up
    verbose = true
    add_column :string_collectible_attributes, :label, :string
    Collectible.all.each do |collectible|
      if verbose
        puts 'Collectible: ' + collectible.name
      end
      collectible.collectible_attributes.each do |collectible_attribute|
        current_class = collectible_attribute.collectible_attribute_value.class
        if current_class == Description
          if verbose
            puts 'replacing ' + current_class.to_s + ':  ' + collectible_attribute.collectible_attribute_value.information
          end
          description_replacement = StringCollectibleAttribute.create(label: current_class.to_s, value: collectible_attribute.collectible_attribute_value.information)
          collectible_attribute.collectible_attribute_value = description_replacement
          collectible_attribute.save
          if verbose
            puts 'Saved'
          end
        
        elsif current_class == VillagerPersonality
          if verbose
            puts 'replacing ' + current_class.to_s + ':  ' + collectible_attribute.collectible_attribute_value.personality_types.first.name
          end
          personality_replacement = StringCollectibleAttribute.create(label: "Personality", value: collectible_attribute.collectible_attribute_value.personality_types.first.name)
          collectible_attribute.collectible_attribute_value = personality_replacement
          collectible_attribute.save
          if verbose
            puts 'Saved'
          end
        end
      end
    end
  end
  def down
    verbose = true
    Collectible.all.each do |collectible|
      if verbose
        puts 'Collectible: ' + collectible.name
      end
      collectible.collectible_attributes.each do |collectible_attribute|
        if collectible_attribute.collectible_attribute_value.class == StringCollectibleAttribute && collectible_attribute.collectible_attribute_value.label == "Description"
          if verbose
            puts 'replacing description:  ' + collectible_attribute.collectible_attribute_value.value
          end
          description_replacement = Description.create(information: collectible_attribute.collectible_attribute_value.value)
          collectible_attribute.collectible_attribute_value = description_replacement
          collectible_attribute.save
          if verbose
            puts 'Saved'
          end
        end
        if collectible_attribute.collectible_attribute_value.class == StringCollectibleAttribute && collectible_attribute.collectible_attribute_value.label == "Personality"
          if verbose
            puts 'replacing personality:  ' + collectible_attribute.collectible_attribute_value.value
          end
          personality_replacement = VillagerPersonality.create
          unless PersonalityType.find_by(name: collectible_attribute.collectible_attribute_value.value)
            if verbose
              puts 'creating PersonalityType: ' + collectible_attribute.collectible_attribute_value.value
            end
            PersonalityType.create(name: collectible_attribute.collectible_attribute_value.value)
          end
          personality_replacement.personality_types << PersonalityType.find_by(name: collectible_attribute.collectible_attribute_value.value)
          collectible_attribute.collectible_attribute_value = personality_replacement
          collectible_attribute.save
          if verbose
            puts 'Saved'
          end
        end
      end
    end
    StringCollectibleAttribute.all.each do |string_collectible_attribute|
      if verbose
        puts 'StringCollectibleAttribute: ' + string_collectible_attribute.value
      end
      if string_collectible_attribute.label == "Description" || string_collectible_attribute.label == "Personality"
        if verbose
          puts 'destroying ' + string_collectible_attribute.value
        end
        string_collectible_attribute.destroy!
      end
    end


    remove_column :string_collectible_attributes, :label, :string
  end
end
