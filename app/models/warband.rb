class Warband < ApplicationRecord
	has_many :equipment
	has_many :dramatis_personaes
	has_many :hired_swords
	has_many :heroes
	has_many :henchmen

	accepts_nested_attributes_for :equipment
	accepts_nested_attributes_for :dramatis_personaes
	accepts_nested_attributes_for :hired_swords
	accepts_nested_attributes_for :heroes
	accepts_nested_attributes_for :henchmen

	self.inheritance_column = 'class_type'

	def caption
		warband_type
	end
end
