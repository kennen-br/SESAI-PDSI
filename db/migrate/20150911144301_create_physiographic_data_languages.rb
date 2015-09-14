class CreatePhysiographicDataLanguages < ActiveRecord::Migration
  def change
    create_table :physiographic_data_languages do |t|
      t.references :physiographic_data, index: true, foreign_key: true
      t.string :language

      t.timestamps null: false
    end
  end
end
