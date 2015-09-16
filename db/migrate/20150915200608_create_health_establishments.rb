class CreateHealthEstablishments < ActiveRecord::Migration
  def change
    create_table :health_establishments do |t|
      t.references :service_network, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
