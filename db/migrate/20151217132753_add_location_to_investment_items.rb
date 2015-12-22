class AddLocationToInvestmentItems < ActiveRecord::Migration
  def change
    add_column :investment_items, :city, :string
    add_column :investment_items, :village, :string
    add_column :investment_items, :pole_base, :string
  end
end
