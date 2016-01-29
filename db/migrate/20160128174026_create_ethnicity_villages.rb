class CreateEthnicityVillages < ActiveRecord::Migration
  def change
    create_table :ethnicities_villages do |t|
      t.references :ethnicity, index: true, foreign_key: true
      t.references :village, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
