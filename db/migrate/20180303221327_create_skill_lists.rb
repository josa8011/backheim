class CreateSkillLists < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_lists do |t|
      t.string :name
      t.string :skill_list_type
      t.references :warband, foreign_key: true

      t.timestamps
    end
  end
end
