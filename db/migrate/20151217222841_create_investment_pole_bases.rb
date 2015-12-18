class CreateInvestmentPoleBases < ActiveRecord::Migration
  def change
    create_table :investment_pole_bases do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
