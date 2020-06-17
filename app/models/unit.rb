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
end
