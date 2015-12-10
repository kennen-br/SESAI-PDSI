class AlterBudgetInvestments < ActiveRecord::Migration
  def change
    add_column :budget_investments, :investment_id, :integer
    add_foreign_key :budget_investments, :investments
  end
end
