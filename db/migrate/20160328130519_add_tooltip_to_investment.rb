class AddTooltipToInvestment < ActiveRecord::Migration
  def change
    add_column :investments, :tooltip, :string
  end
end
