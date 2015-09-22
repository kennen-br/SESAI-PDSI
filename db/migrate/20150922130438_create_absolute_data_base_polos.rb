class CreateAbsoluteDataBasePolos < ActiveRecord::Migration
  def change
    create_table :absolute_data_base_polos do |t|
      t.references :absolute_datum, index: true, foreign_key: true
      t.references :base_polo, index: true, foreign_key: true
      t.references :pdsi, index: true, foreign_key: true
      t.integer :value

      t.timestamps null: false
    end
  end
end
