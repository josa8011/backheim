class SkillCategory < ApplicationRecord
  has_many :skill_skill_categories
  has_many :skills, through: :skill_skill_categories
  belongs_to :warband, optional: true
  belongs_to :database

  def self.default_scope
    unless Database::current_tree.nil?
      joins("INNER JOIN (SELECT name, MAX(database_id) AS database_id FROM skill_categories WHERE database_id IN (" + Database::current_tree.join(",") + ") GROUP BY name) AS s2 ON skill_categories.name = s2.name AND skill_categories.database_id = s2.database_id").order(:name)
    end
  end
end
