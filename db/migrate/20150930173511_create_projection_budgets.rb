class CreateProjectionBudgets < ActiveRecord::Migration
  def change
    create_table :projection_budgets do |t|
      t.references :projection_budget_item, index: true, foreign_key: true
      t.references :pdsi, index: true, foreign_key: true
      t.integer :quantidade_atual
      t.integer :quantidade_necessaria
      t.decimal :valor_estimado
      t.integer :quantidade_estimada_2016
      t.decimal :valor_unitario_2016
      t.integer :quantidade_estimada_2017
      t.decimal :valor_unitario_2017
      t.integer :quantidade_estimada_2018
      t.decimal :valor_unitario_2018
      t.integer :quantidade_estimada_2019
      t.decimal :valor_unitario_2019

      t.timestamps null: false
    end
  end
end
