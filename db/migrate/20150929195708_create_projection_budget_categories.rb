class CreateProjectionBudgetCategories < ActiveRecord::Migration
  def change
    create_table :projection_budget_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
