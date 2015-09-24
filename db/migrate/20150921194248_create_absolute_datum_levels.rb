class CreateAbsoluteDatumLevels < ActiveRecord::Migration
  def change
    create_table :absolute_datum_levels do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
