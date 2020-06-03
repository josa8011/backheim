class AddWarriorTypeToUnit < ActiveRecord::Migration[5.1]
  def change
    add_column :units, :warrior_type, :string
  end
end
