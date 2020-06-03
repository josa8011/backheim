class UnitSkillList < ApplicationRecord
  belongs_to :unit
  belongs_to :skill_list
  belongs_to :database, optional: true

  scope :for_unit, ->(unit) {where(unit_id: unit.id)}

  def self.default_scope
    unless Database::current_tree.nil?
      where("unit_skill_lists.database_id IN (" + Database::current_tree.join(",") + ")")
    end
  end
end
