class AddNumeroSedePolosBaseToDemographicData < ActiveRecord::Migration
  def change
    add_column :demographic_datas, :numero_sede_polos_base, :string
  end
end
