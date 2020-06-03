class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :units do |t|
      t.string :type
      t.string :name
      t.string :suggestion
      t.integer :exp
      t.integer :cost
      t.integer :rating
      t.references :race, foreign_key: true
      t.references :warband, foreign_key: true
      t.boolean :is_large
      t.integer :starting_exp
      t.string :full_type
      t.integer :gained_levels
      t.integer :wounds_left
      t.boolean :ooa
      t.string :class_type
      t.float :rout_test_contribution
      t.string :warrior_type

      t.timestamps
    end
  end
end
