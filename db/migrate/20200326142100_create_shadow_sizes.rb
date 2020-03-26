class CreateShadowSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :shadow_sizes do |t|

      t.timestamps
    end
  end
end
