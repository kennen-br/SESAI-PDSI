class AddTransportationToDemographicData < ActiveRecord::Migration
  def change
    add_column :demographic_datas, :fluvial, :boolean
    add_column :demographic_datas, :rodoviario, :boolean
    add_column :demographic_datas, :aereo, :boolean
  end
end
