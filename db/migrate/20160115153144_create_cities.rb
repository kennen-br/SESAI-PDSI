class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :cod_uf
      t.string :name_uf
      t.integer :cod_city
      t.string :city

      t.timestamps null: false
    end
  end
end
