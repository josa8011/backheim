class CreateMagicCategoriesConns < ActiveRecord::Migration[5.1]
  def change
    create_table :magic_categories_conns do |t|
      t.references :unit, foreign_key: true
      t.references :skill_category, foreign_key: true
      t.timestamps
    end
  end
end
