class Item < ApplicationRecord
  self.inheritance_column = 'class_type'
  
  def caption
    name
  end

  def self.paramify_json json
    json
  end
end
  