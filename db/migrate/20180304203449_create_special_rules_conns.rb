class CreateSpecialRulesConns < ActiveRecord::Migration[5.1]
  def change
    create_table :special_rules_conns do |t|
      t.references :unit, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
