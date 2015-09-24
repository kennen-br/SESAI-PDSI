class CreateInfrastructureBuildingTypes < ActiveRecord::Migration
  def change
    create_table :infrastructure_building_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
