class AddPopulationToBasePolo < ActiveRecord::Migration
  def change
    add_column :base_polos, :population, :integer
  end
end
