class Unit < ApplicationRecord
  belongs_to :race
  belongs_to :warband
  has_many :unit_skill_categories
  has_many :skill_categories, through: :unit_skill_categories 
  has_many :starting_skills_conn
  has_many :special_skills_conn
  has_many :special_rules_conn
  has_one :magic_categories_conn
  has_many :starting_equipment_conn
  has_many :special_skills, through: :special_skills_conn, source: :skill
  has_many :special_rules, through: :special_rules_conn, source: :skill
  has_one :magic_category, through: :magic_categories_conn, source: :skill_category
  has_many :starting_equipment, through: :starting_equipment_conn, source: :equipment
  belongs_to :database

  accepts_nested_attributes_for :special_skills, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :special_rules, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :magic_category, allow_destroy: true
  accepts_nested_attributes_for :starting_equipment, reject_if: :all_blank, allow_destroy: true

  def self.default_scope
    unless Database::current_tree.nil?
      joins("INNER JOIN (SELECT suggestion, MAX(database_id) AS database_id FROM units WHERE database_id IN (" + Database::current_tree.join(",") + ") GROUP BY suggestion) AS u2 ON units.suggestion = u2.suggestion AND units.database_id = u2.database_id").order(:unit_type)
    end
  end

  def caption
    suggestion
  end
end
