class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :name
      t.boolean :usable
      t.integer :cost
      t.integer :uses_per_game
      t.string :description
      t.string :reminder

      t.timestamps
    end
  end
end
