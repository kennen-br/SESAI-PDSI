class CreateEthnicities < ActiveRecord::Migration
  def change
    create_table :ethnicities do |t|
      t.string :name,       null: false
      t.integer :sesai_id,  null: false

      t.timestamps null: false
    end

    create_table :ethnicities_villages do |t|
      t.belongs_to  :ethnicity, index: true
      t.belongs_to  :village,   index: true
    end
  end
end
