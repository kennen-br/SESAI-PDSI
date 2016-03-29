class AddTooltipToCost < ActiveRecord::Migration
  def change
    add_column :costs, :tooltip, :string
  end
end
