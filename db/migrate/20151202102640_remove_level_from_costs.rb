class RemoveLevelFromCosts < ActiveRecord::Migration
  def change
    remove_column :costs, :level, :int
  end
end
