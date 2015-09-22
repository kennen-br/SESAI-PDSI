class CreateSpecificAbsoluteData < ActiveRecord::Migration
  def change
    create_table :specific_absolute_data do |t|
      t.references :absolute_datum, index: true, foreign_key: true
      t.references :dsei, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
