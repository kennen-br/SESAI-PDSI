class CreateBudgetInvestments < ActiveRecord::Migration
  def change
    create_table :budget_investments do |t|
      t.references :pdsi, index: true, foreign_key: true
      t.integer :quantity_2016
      t.decimal :unitary_amount_2016
      t.decimal :forecast_amout_2016
      t.integer :quantity_2017
      t.decimal :unitary_amount_2017
      t.decimal :forecast_amout_2017
      t.integer :quantity_2018
      t.decimal :unitary_amount_2018
      t.decimal :forecast_amout_2018
      t.integer :quantity_2019
      t.decimal :unitary_amount_2019
      t.decimal :forecast_amout_2019
      t.timestamps null: false
    end
  end
end
