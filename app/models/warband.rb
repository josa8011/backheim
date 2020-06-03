class Warband < ApplicationRecord
	belongs_to :database
	has_one :skill_category
	has_many :skill_skill_categories, through: :skill_category
	has_many :skills, through: :skill_skill_categories
	
	accepts_nested_attributes_for :skills

  def self.default_scope
    unless Database::current_tree.nil?
      joins("INNER JOIN (SELECT warband_type, MAX(database_id) AS database_id FROM warbands WHERE database_id IN (" + Database::current_tree.join(",") + ") GROUP BY warband_type) AS w2 ON warbands.warband_type = w2.warband_type AND warbands.database_id = w2.database_id").order(:warband_type)
    end
  end

	def caption
		warband_type
	end
end
