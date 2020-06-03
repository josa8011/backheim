class SkillList < ApplicationRecord
  has_many :skill_skill_lists
  has_many :skills, through: :skill_skill_lists
  belongs_to :warband, optional: true
  belongs_to :database

  def self.default_scope
    unless Database::current_tree.nil?
      joins("INNER JOIN (SELECT name, MAX(database_id) AS database_id FROM skill_lists WHERE database_id IN (" + Database::current_tree.join(",") + ") GROUP BY name) AS s2 ON skill_lists.name = s2.name AND skill_lists.database_id = s2.database_id").order(:name)
    end
  end
end
