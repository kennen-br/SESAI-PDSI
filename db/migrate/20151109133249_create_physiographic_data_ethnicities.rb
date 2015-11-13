class CreatePhysiographicDataEthnicities < ActiveRecord::Migration
  def change
    create_table :physiographic_data_ethnicities do |t|
      t.references :ethnicity, index: true, foreign_key: true
      t.references :physiographic_data, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
