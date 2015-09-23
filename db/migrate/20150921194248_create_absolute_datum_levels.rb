class CreateAbsoluteDatumLevels < ActiveRecord::Migration
  def change
    create_table :absolute_datum_levels do |t|
      t.string :name

      t.timestamps null: false
    end

    AbsoluteDatumLevel.create name: 'Polo Base'
    AbsoluteDatumLevel.create name: 'CASAI'
    AbsoluteDatumLevel.create name: 'DSEI'
  end
end
