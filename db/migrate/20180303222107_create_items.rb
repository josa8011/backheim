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
      t.integer :range
      t.boolean :droppable
      t.string :class_type

      t.belongs_to :warband
      t.belongs_to :unit

      t.timestamps
    end
  end
end
