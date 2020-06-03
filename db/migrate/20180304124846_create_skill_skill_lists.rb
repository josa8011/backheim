class CreateSkillSkillLists < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_skill_lists do |t|
      t.references :skill, foreign_key: true
      t.references :skill_list, foreign_key: true

      t.timestamps
    end
  end
end
