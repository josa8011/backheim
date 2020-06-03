class Skill < ApplicationRecord
  has_many :skill_skill_categories
  has_and_belongs_to_many :skill_categories, through: :skill_skill_categories
  belongs_to :database

  def self.default_scope
    unless Database::current_tree.nil?
      joins("INNER JOIN (SELECT name, MAX(database_id) AS database_id FROM skills WHERE database_id IN (" + Database::current_tree.join(",") + ") GROUP BY name) AS s2 ON skills.name = s2.name AND skills.database_id = s2.database_id").order(:name)
    end
  end

  def caption
    name
  end
end
