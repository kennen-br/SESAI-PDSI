class AlterBudgetCorrectionFactors < ActiveRecord::Migration
  def change
    add_column :budget_correction_factors, :year, :int
    add_column :budget_correction_factors, :value, :decimal
  end
end
