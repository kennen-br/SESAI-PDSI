class CreateSpecificResults < ActiveRecord::Migration
  def change
    create_table :specific_results do |t|
      t.references :result, index: true, foreign_key: true
      t.references :dsei, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
