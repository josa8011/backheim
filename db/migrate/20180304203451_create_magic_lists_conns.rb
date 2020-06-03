class CreateMagicListsConns < ActiveRecord::Migration[5.1]
  def change
    create_table :magic_lists_conns do |t|
      t.references :unit, foreign_key: true
      t.references :skill_list, foreign_key: true
      t.timestamps
    end
  end
end
