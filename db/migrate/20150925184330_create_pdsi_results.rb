class CreatePdsiResults < ActiveRecord::Migration
  def change
    create_table :pdsi_results do |t|
      t.references :pdsi, index: true, foreign_key: true
      t.references :result, index: true, foreign_key: true
      t.integer :value

      t.timestamps null: false
    end
  end
end
