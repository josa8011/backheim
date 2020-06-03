class CreateEquipment < ActiveRecord::Migration[5.1]
  def change
    create_table :equipment do |t|
      t.string :name
      t.boolean :usable
      t.integer :charges
      t.integer :cost
      t.integer :uses_per_game
      t.string :description
      t.string :reminder
      t.string :special_cost

      t.timestamps
    end
  end
end
