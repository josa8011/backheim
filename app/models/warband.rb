class Warband < ApplicationRecord
	has_many :equipment
	has_many :dramatis_peronaes
	has_many :hired_swords
	has_many :heroes
	has_many :henchmen

	accepts_nested_attributes_for :equipment
	accepts_nested_attributes_for :dramatis_peronaes
	accepts_nested_attributes_for :hired_swords
	accepts_nested_attributes_for :heroes
	accepts_nested_attributes_for :henchmen

	def caption
		warband_type
	end
end
