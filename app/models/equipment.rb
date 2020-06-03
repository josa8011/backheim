class Equipment < ApplicationRecord
	belongs_to :database

	def self.default_scope
		unless Database::current_tree.nil?
			joins("INNER JOIN (SELECT name, MAX(database_id) AS database_id FROM equipment WHERE database_id IN (" + Database::current_tree.join(",") + ") GROUP BY name) AS e2 ON equipment.name = e2.name AND equipment.database_id = e2.database_id").order(:name)
		end
	end
	
	def caption
		name
	end
end
