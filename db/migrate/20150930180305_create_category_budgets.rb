class CreateCategoryBudgets < ActiveRecord::Migration
  def change
    create_table :category_budgets do |t|
      t.references :projection_budget_category, index: true, foreign_key: true
      t.references :pdsi, index: true, foreign_key: true
      t.decimal :value_2016
      t.decimal :value_2017
      t.decimal :value_2018
      t.decimal :value_2019

      t.timestamps null: false
    end
  end
end
