class Stat < ApplicationRecord
    self.inheritance_column = 'class_type'
  
    def self.paramify_json stat, json
        json[:name] = stat.to_s
        json
    end
  end
    