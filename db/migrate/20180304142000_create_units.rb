class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :units do |t|
      t.string :type
      t.string :name
      t.string :suggestion
      t.string :warband_type
      t.integer :exp
      t.integer :cost
      t.integer :rating
      t.boolean :is_large
      t.integer :starting_exp
      t.string :full_type
      t.integer :gained_levels
      t.integer :wounds_left
      t.integer :num_ooa
      t.integer :num_units
      t.float :rout_test_contribution
      t.string :warrior_type
      t.string :skill_categories, array: true
      t.string :class_type

      t.belongs_to :warband

      t.timestamps
    end
  end
end
