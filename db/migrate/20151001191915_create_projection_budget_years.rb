class CreateProjectionBudgetYears < ActiveRecord::Migration
  def change
    create_table :projection_budget_years do |t|
      t.references :projection_budget, index: true, foreign_key: true
      t.integer :year
      t.integer :quantidade_estimada
      t.decimal :valor_unitario

      t.timestamps null: false
    end

    remove_column :projection_budgets, :quantidade_necessaria, :integer
    remove_column :projection_budgets, :valor_estimado, :decimal
    remove_column :projection_budgets, :quantidade_estimada_2016, :integer
    remove_column :projection_budgets, :valor_unitario_2016, :decimal
    remove_column :projection_budgets, :quantidade_estimada_2017, :integer
    remove_column :projection_budgets, :valor_unitario_2017, :decimal
    remove_column :projection_budgets, :quantidade_estimada_2018, :integer
    remove_column :projection_budgets, :valor_unitario_2018, :decimal
    remove_column :projection_budgets, :quantidade_estimada_2019, :integer
    remove_column :projection_budgets, :valor_unitario_2019, :decimal
  end
end
