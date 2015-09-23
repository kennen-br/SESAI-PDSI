class CreateAbsoluteDataCasais < ActiveRecord::Migration
  def change
    create_table :absolute_data_casais do |t|
      t.references :absolute_datum, index: true, foreign_key: true
      t.references :casai, index: true, foreign_key: true
      t.references :pdsi, index: true, foreign_key: true
      t.integer :value

      t.timestamps null: false
    end
  end
end
