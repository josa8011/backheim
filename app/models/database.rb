class Database < ApplicationRecord
  mattr_accessor :current_tree
  
  @@current_tree = nil

  def db_tree
    sql = "WITH RECURSIVE db_tree AS 
    (
        SELECT id, database_id
        FROM Databases
        WHERE id = #{id}
        UNION ALL
        SELECT d.id, d.database_id
        FROM Databases d
        JOIN db_tree p on d.id = p.database_id
    ) 
    SELECT id
    FROM db_tree"
    ActiveRecord::Base.connection.execute(sql).pluck("id")
  end
end
