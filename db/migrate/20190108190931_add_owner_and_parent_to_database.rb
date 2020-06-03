class AddOwnerAndParentToDatabase < ActiveRecord::Migration[5.1]
  def change
    add_reference :databases, :user, index: true
    add_reference :databases, :database, index: true
  end
end
