class AddLevelToCosts < ActiveRecord::Migration
  def change
  	add_column :costs, :level, :int
  end
end
