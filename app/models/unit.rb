class Unit < ApplicationRecord
  has_many :skills
  has_many :dropped_equipment
  has_many :stats
  has_many :equipment

	accepts_nested_attributes_for :skills
	accepts_nested_attributes_for :dropped_equipment
	accepts_nested_attributes_for :stats
	accepts_nested_attributes_for :equipment

  self.inheritance_column = 'class_type'
  
  def caption
    suggestion
  end

  def self.paramify_json json
    json.each_with_index do |_, i|
      json[i][:skills_attributes] = Skill.paramify_json(json[i].delete :skills)
      json[i][:equipment_attributes] = Equipment.paramify_json(json[i].delete :equipment)
      json[i][:dropped_equipment_attributes] = Equipment.paramify_json(json[i].delete :dropped_equipment)
      json[i][:stats_attributes] = []
      for stat in [:m, :ws, :bs, :s, :t, :w, :i, :a, :ld]
        json[i][:stats_attributes].push(Stat.paramify_json(stat, json[i].delete(stat)))
      end
    end
    json
  end
end
