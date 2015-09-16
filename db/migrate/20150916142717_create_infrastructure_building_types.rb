class CreateInfrastructureBuildingTypes < ActiveRecord::Migration
  def change
    create_table :infrastructure_building_types do |t|
      t.string :name

      t.timestamps null: false
    end

    InfrastructureBuildingType.create name: 'Sede do DSEI'
    InfrastructureBuildingType.create name: 'CASAI'
    InfrastructureBuildingType.create name: 'Sede de Polo Base Tipo 1 (Assistencial e Administrativo)'
    InfrastructureBuildingType.create name: 'Sede de Polo Base Tipo 2 (Administrativo)'
    InfrastructureBuildingType.create name: 'UBSI'
  end
end
