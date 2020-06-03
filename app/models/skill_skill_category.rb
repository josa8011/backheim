class SkillSkillCategory < ApplicationRecord
  belongs_to :skill
  belongs_to :skill_category
  belongs_to :database

  def self.default_scope
    unless Database::current_tree.nil?
      where("skill_skill_categories.database_id IN (" + Database::current_tree.join(",") + ")")
    end
  end
end
