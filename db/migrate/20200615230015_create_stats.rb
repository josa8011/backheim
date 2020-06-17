class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.string :name
      t.integer :racial_max
      t.integer :value
      t.boolean :is_leveled
      t.boolean :is_dirty

      t.belongs_to :unit

      t.timestamps
    end
  end
end
