class CreateDestinationTypes < ActiveRecord::Migration
  def change
    create_table :destination_types do |t|
      t.string :name

      t.timestamps null: false
    end

    DestinationType.create name: 'UBSI'
    DestinationType.create name: 'Polo Base'
    DestinationType.create name: 'CASAI'
    DestinationType.create name: 'Média e Alta Complexidade'
  end
end
