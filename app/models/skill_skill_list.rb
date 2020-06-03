class SkillSkillList < ApplicationRecord
  belongs_to :skill
  belongs_to :skill_list
  belongs_to :database

  def self.default_scope
    unless Database::current_tree.nil?
      where("skill_skill_lists.database_id IN (" + Database::current_tree.join(",") + ")")
    end
  end
end
