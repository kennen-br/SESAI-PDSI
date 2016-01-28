class AddValueGlobalToResult < ActiveRecord::Migration
  def change
  	add_column :results, :value_global, :int
  end
end
