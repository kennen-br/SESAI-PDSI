class AddYearReferenceToInvestmentItems < ActiveRecord::Migration
  def change
    add_column :investment_items, :year_reference, :string
  end
end
