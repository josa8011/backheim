class SpecialSkillsConn < ApplicationRecord
  belongs_to :unit
  belongs_to :skill
  belongs_to :database

  def self.default_scope
    unless Database::current_tree.nil?
      where("special_skills_conns.database_id IN (" + Database::current_tree.join(",") + ")")
    end
  end
end
