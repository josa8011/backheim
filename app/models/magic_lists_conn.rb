class MagicListsConn < ApplicationRecord
    belongs_to :unit
    belongs_to :skill_list
    belongs_to :database

    def self.default_scope
      unless Database::current_tree.nil?
        where("magic_lists_conns.database_id IN (" + Database::current_tree.join(",") + ")")
      end
    end
end
