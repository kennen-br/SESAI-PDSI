class DropAbsoluteTables < ActiveRecord::Migration
  def change
    drop_table :absolute_data_dseis
    drop_table :absolute_data_base_polos
    drop_table :absolute_data_casais
    drop_table :absolute_data
    drop_table :absolute_datum_levels
  end
end
