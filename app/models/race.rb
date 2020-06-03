class Race < ApplicationRecord
  belongs_to :database

  def self.default_scope
    unless Database::current_tree.nil?
      joins("INNER JOIN (SELECT name, MAX(database_id) AS database_id FROM races WHERE database_id IN (" + Database::current_tree.join(",") + ") GROUP BY name) AS r2 ON races.name = r2.name AND races.database_id = r2.database_id").order(:name)
    end
  end
end
