class CreateDseis < ActiveRecord::Migration
  def change
    create_table :dseis do |t|
      t.string :name, null: false
      t.integer :sesai_id, null: false

      t.timestamps null: false
    end
  end
end
