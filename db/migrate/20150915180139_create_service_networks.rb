class CreateServiceNetworks < ActiveRecord::Migration
  def change
    create_table :service_networks do |t|
      t.references :base_polo, index: true, foreign_key: true
      t.references :pdsi, index: true, foreign_key: true
      t.string :city_name

      t.timestamps null: false
    end
  end
end
