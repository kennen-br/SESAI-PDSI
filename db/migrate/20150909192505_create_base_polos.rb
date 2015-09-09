class CreateBasePolos < ActiveRecord::Migration
  def change
    create_table :base_polos do |t|
      t.references :dsei, index: true, foreign_key: true
      t.string :name, null: false
      t.integer :sesai_id, null: false

      t.timestamps null: false
    end
  end
end
