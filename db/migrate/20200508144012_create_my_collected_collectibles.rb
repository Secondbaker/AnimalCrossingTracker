class CreateMyCollectedCollectibles < ActiveRecord::Migration[6.0]
  def change
    create_table :my_collected_collectibles do |t|
      t.references :user, foreign_key: true
      t.references :collectible, foreign_key: true
      t.hstore :completions
      t.index([:user_id, :collectible_id], unique: true, name: 'by_user_collectible')
      t.index([:collectible_id, :user_id], unique: true, name: 'by_collectible_user')

      t.timestamps
    end
  end
end
