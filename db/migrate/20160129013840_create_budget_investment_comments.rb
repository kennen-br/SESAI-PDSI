class CreateBudgetInvestmentComments < ActiveRecord::Migration
  def change
    create_table :budget_investment_comments do |t|
      t.references :budget_investment, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :year, limit: 4
      t.text :comment
      t.text :users, default: '[]'

      t.timestamps null: false
    end
  end
end
