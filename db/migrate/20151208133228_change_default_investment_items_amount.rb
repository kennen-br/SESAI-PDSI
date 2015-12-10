class ChangeDefaultInvestmentItemsAmount < ActiveRecord::Migration
  def change
    change_column_default :investment_items, :quantity_2016, 1
    change_column_default :investment_items, :quantity_2017, 1
    change_column_default :investment_items, :quantity_2018, 1
    change_column_default :investment_items, :quantity_2019, 1
  end
end
