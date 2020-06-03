class CreateStartingEquipmentConns < ActiveRecord::Migration[5.1]
  def change
    create_table :starting_equipment_conns do |t|
      t.references :unit, foreign_key: true
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end
