class AddOrderToResponsability < ActiveRecord::Migration
  def change
    add_column :responsabilities, :order, :integer
  end
end
