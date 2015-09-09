class CreateVillages < ActiveRecord::Migration
  def change
    create_table :villages do |t|
      t.references :base_polo, index: true, foreign_key: true
      t.string :name,       null: false
      t.integer :sesai_id,  null: false

      t.timestamps null: false
    end
  end
end
