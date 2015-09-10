class CreatePdsiBasePoloData < ActiveRecord::Migration
  def change
    create_table :pdsi_base_polo_data do |t|
      t.references :pdsi, index: true, foreign_key: true
      t.references :base_polo, index: true, foreign_key: true
      t.string :city_name

      t.timestamps null: false
    end
  end
end
