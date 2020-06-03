class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :units do |t|
      t.string :unit_type
      t.string :name
      t.string :suggestion
      t.integer :m
      t.integer :ws
      t.integer :bs
      t.integer :s
      t.integer :t
      t.integer :w
      t.integer :i
      t.integer :a
      t.integer :ld
      t.integer :exp
      t.integer :cost
      t.integer :rating
      t.references :race, foreign_key: true
      t.references :warband, foreign_key: true

      t.timestamps
    end
  end
end
