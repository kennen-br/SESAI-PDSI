class AddCityNameToPhysiographicData < ActiveRecord::Migration
  def change
    add_column :physiographic_datas, :city_name, :string
  end
end
