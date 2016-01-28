class AddVillagePolulationToPhysiographicData < ActiveRecord::Migration
  def change
    add_column :physiographic_datas, :village_population, :integer
  end
end
