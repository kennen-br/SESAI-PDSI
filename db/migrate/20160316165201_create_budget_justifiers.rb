class CreateBudgetJustifiers < ActiveRecord::Migration
  def change
    create_table :budget_justifiers do |t|
      t.string :description
      t.string :year

      t.references :user, index: true, foreign_key: true
      t.references :budget_investment, index: true, foreign_key: true
      t.references :budget_forecast, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
