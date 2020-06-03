class CreateRaces < ActiveRecord::Migration[5.1]
  def change
    create_table :races do |t|
      t.string :name
      t.integer :max_m
      t.integer :max_ws
      t.integer :max_bs
      t.integer :max_s
      t.integer :max_t
      t.integer :max_w
      t.integer :max_i
      t.integer :max_a
      t.integer :max_ld

      t.timestamps
    end
  end
end
