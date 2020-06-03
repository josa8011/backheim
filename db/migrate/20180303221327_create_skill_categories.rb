class CreateSkillCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_categories do |t|
      t.string :name
      t.string :type
      t.references :warband, foreign_key: true
      t.timestamps
    end
  end
end
