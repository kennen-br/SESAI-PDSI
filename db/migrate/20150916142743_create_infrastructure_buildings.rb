class CreateInfrastructureBuildings < ActiveRecord::Migration
  def change
    create_table :infrastructure_buildings do |t|
      t.references :pdsi, index: true, foreign_key: true
      t.references :infrastructure_building_type, index: { name: 'idx_ibt_on_ibt_id' }, foreign_key: true
      t.string :name
      t.string :city_name
      t.references :village, index: true, foreign_key: true
      t.string :cnes
      t.string :building_status
      t.string :ground_status

      t.timestamps null: false
    end
  end
end
