class StartingEquipmentConn < ApplicationRecord
  belongs_to :unit
  belongs_to :equipment
  belongs_to :database

  def self.default_scope
    unless Database::current_tree.nil?
      where("starting_equipment_conns.database_id IN (" + Database::current_tree.join(",") + ")")
    end
  end
end
