class CreateJoinTableFishSizeShadowSize < ActiveRecord::Migration[6.0]
  def change
    create_join_table :fish_sizes, :shadow_sizes do |t|
      # t.index [:fish_size_id, :shadow_size_id]
      # t.index [:shadow_size_id, :fish_size_id]
    end
  end
end
