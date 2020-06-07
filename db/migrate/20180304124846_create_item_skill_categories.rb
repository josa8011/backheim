class CreateItemSkillCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :item_skill_categories do |t|
      t.references :item, foreign_key: true
      t.references :skill_category, foreign_key: true

      t.timestamps
    end
  end
end
