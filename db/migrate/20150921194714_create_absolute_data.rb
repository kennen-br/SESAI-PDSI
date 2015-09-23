class CreateAbsoluteData < ActiveRecord::Migration
  def change
    create_table :absolute_data do |t|
      t.references :absolute_datum_level, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
