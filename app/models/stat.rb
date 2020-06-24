class Stat < ApplicationRecord
  self.inheritance_column = 'class_type'
  def self.paramify_json json
    json
  end
end
