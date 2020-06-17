class CreateWarbands < ActiveRecord::Migration[5.1]
  def change
    create_table :warbands do |t|
      t.string :type
      t.string :name
      t.string :special_skill_category
      t.string :sources, array: true
      t.string :broheimGrade
      t.integer :max_units
      t.string :special_rules, array: true
      t.integer :games_played
      t.integer :shards
      t.integer :gold_crowns
      t.string :mode

      t.timestamps
    end
  end
end
