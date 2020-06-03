class CreateUnitSkillCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :unit_skill_categories do |t|
      t.references :unit, foreign_key: true
      t.references :skill_category, foreign_key: true

      t.timestamps
    end
  end
end
