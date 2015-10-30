class CreateBudgetCorrectionFactors < ActiveRecord::Migration
  def change
    create_table :budget_correction_factors do |t|

      t.timestamps null: false
    end
  end
end
