class AddValueGlobalToPdsiResults < ActiveRecord::Migration
  def change
  	add_column :pdsi_results, :value_global, :int
  end
end
