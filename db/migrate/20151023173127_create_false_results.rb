class CreateFalseResults < ActiveRecord::Migration
  def change
    create_table :false_results do |t|
      t.belongs_to :dsei, index: true, foreign_key: true
      t.belongs_to :result, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
