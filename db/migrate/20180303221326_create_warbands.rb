class CreateWarbands < ActiveRecord::Migration[5.1]
  def change
    create_table :warbands do |t|
      t.string :type

      t.timestamps
    end
  end
end
