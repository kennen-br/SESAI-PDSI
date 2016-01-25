class AddNameToCapais < ActiveRecord::Migration
  def change
    add_column :capais, :name, :string
  end
end
