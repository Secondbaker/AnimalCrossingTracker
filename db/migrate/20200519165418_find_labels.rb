class FindLabels < ActiveRecord::Migration[6.0]
  def up
    verbose = false
    StringCollectibleAttribute.all.each do |string_collectible_attribute|
      if verbose
        puts 'StringCollectibleAttribute: ' + string_collectible_attribute.id.to_s
      end
      if string_collectible_attribute.label == nil
        if string_collectible_attribute.collectible_attribute != nil
          if verbose
            puts 'Adding label: ' + string_collectible_attribute.collectible_attribute.collectible_attribute_type.name
          end
          string_collectible_attribute.label = string_collectible_attribute.collectible_attribute.collectible_attribute_type.name
          string_collectible_attribute.save
          puts 'Saved'
        end
      end
    end
  end
  # We don't really need to undo this on the way down.  
  # If you keep going down, the column will just be deleted.
  def down
  end
end
