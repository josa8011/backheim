class CreateWarbands < ActiveRecord::Migration[5.1]
  def change
    create_table :warbands do |t|
      t.string :type
      t.string :name
      t.integer :games_played
      t.integer :shards
      t.integer :gold_crowns
      t.string :mode

      t.timestamps
    end
  end
end
