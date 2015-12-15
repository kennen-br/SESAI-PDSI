class AddTypeToCosts < ActiveRecord::Migration
  def change
    add_column :costs, :type, :int
  end
end
