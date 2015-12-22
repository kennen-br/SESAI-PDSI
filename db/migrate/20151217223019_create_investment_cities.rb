class CreateInvestmentCities < ActiveRecord::Migration
  def change
    create_table :investment_cities do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
