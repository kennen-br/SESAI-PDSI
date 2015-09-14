class CreateEthnicities < ActiveRecord::Migration
  def change
    create_table :ethnicities do |t|
      t.string :name,       null: false
      t.integer :sesai_id,  null: false

      t.timestamps null: false
    end

    create_table :ethnicities_villages do |t|
      t.belongs_to  :ethnicity, index: true, foreign_key: true
      t.belongs_to  :village,   index: true, foreign_key: true
    end
  end
end
