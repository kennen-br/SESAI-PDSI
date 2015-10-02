class CreateProjectionBudgetStructures < ActiveRecord::Migration
  def change
    create_table :projection_budget_structures do |t|
      t.references :projection_budget_year, index: true, foreign_key: true
      t.integer :type
      t.string :name

      t.timestamps null: false
    end
  end
end
