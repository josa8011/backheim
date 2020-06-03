class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :usable
      t.integer :charges
      t.integer :cost
      t.integer :uses_per_game
      t.string :description
      t.string :reminder
      t.string :special_cost
      t.string :type
      t.string :class_type

      t.timestamps
    end
  end
end
