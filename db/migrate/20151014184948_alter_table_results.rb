class AlterTableResults < ActiveRecord::Migration
  def change
    add_column :results, :value_2016, :integer
    add_column :results, :value_2017, :integer
    add_column :results, :value_2018, :integer
    add_column :results, :value_2019, :integer
    add_column :results, :orientacoes_dsei, :text
    add_column :results, :orientacoes_sistema, :text

    remove_column :results, :reference_value, :integer
    remove_column :results, :parent_id, :integer
  end
end
