class CreateAbsoluteDataDseis < ActiveRecord::Migration
  def change
    create_table :absolute_data_dseis do |t|
      t.references :absolute_datum, index: true, foreign_key: true
      t.references :dsei, index: true, foreign_key: true
      t.references :pdsi, index: true, foreign_key: true
      t.integer :value

      t.timestamps null: false
    end
  end
end
