class CreateProjectionBudgetItems < ActiveRecord::Migration
  def change
    create_table :projection_budget_items do |t|
      t.references :projection_budget_category, index: true, foreign_key: true
      t.string :name
      t.decimal :unit_value

      t.timestamps null: false
    end
  end
end
