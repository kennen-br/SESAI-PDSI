class CreateServiceNetworkCities < ActiveRecord::Migration
  def change
    create_table :service_network_cities do |t|
      t.references :service_network, index: true, foreign_key: true
      t.string :city_name

      t.timestamps null: false
    end
  end
end
