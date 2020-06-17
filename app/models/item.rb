class Item < ApplicationRecord
    self.inheritance_column = 'class_type'
    
    def caption
      name
    end
  end
  