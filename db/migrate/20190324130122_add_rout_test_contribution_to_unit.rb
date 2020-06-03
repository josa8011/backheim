class AddRoutTestContributionToUnit < ActiveRecord::Migration[5.1]
  def change
    add_column :units, :rout_test_contribution, :float
    Unit.where(suggestion: "Goblin Warriors").first.update_attributes(rout_test_contribution: 0.5)
    Unit.where(suggestion: "Swabbies").first.update_attributes(rout_test_contribution: 0.0)
  end
end
