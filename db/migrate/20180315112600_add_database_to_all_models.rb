class AddDatabaseToAllModels < ActiveRecord::Migration[5.1]
  def change
    add_reference :equipment, :database, index: true
    add_reference :races, :database, index: true
    add_reference :skills, :database, index: true
    add_reference :skill_lists, :database, index: true
    add_reference :skill_skill_lists, :database, index: true
    add_reference :units, :database, index: true
    add_reference :special_skills_conns, :database, index: true
    add_reference :special_rules_conns, :database, index: true
    add_reference :unit_skill_lists, :database, index: true
    add_reference :warbands, :database, index: true
    add_reference :starting_equipment_conns, :database, index: true
    add_reference :magic_lists_conns, :database, index: true
  end
end
