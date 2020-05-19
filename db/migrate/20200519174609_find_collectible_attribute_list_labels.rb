class FindCollectibleAttributeListLabels < ActiveRecord::Migration[6.0]
  def up
    verbose = false
    CollectibleAttributeList.all.each do |collectible_attribute_list|
      if verbose
        puts 'CollectibleAttributeList: ' + collectible_attribute_list.id.to_s
        puts 'Adding label: ' + collectible_attribute_list.collectible_attribute.collectible_attribute_type.name
      end
      collectible_attribute_list.label = collectible_attribute_list.collectible_attribute.collectible_attribute_type.name
      collectible_attribute_list.save
      if verbose
        puts 'Saved'
      end
    end
  end
  # we don't care if these stick around when we go down a step; they'll be deleted if we go down enough steps
  def down

  end
end
