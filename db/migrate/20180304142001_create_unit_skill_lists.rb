class CreateUnitSkillLists < ActiveRecord::Migration[5.1]
  def change
    create_table :unit_skill_lists do |t|
      t.references :unit, foreign_key: true
      t.references :skill_list, foreign_key: true

      t.timestamps
    end
  end
end
