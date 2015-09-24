class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :result_level, index: true, foreign_key: true
      t.references :result_category, index: true, foreign_key: true
      t.integer :reference_value
      t.integer :parent_id
      t.boolean :is_specific
      t.boolean :is_percentage
      t.text :result_text

      t.timestamps null: false
    end
  end
end
