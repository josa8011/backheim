class CreateSpecialSkillsConns < ActiveRecord::Migration[5.1]
  def change
    create_table :special_skills_conns do |t|
      t.references :unit, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
