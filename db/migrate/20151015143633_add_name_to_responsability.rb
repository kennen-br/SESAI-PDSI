class AddNameToResponsability < ActiveRecord::Migration
  def change
    add_column :responsabilities, :name, :string
  end
end
