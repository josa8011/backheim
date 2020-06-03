class CreateWarbands < ActiveRecord::Migration[5.1]
  def change
    create_table :warbands do |t|
      t.string :warband_type

      t.timestamps
    end
  end
end
