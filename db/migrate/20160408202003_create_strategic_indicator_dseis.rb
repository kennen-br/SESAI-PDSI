class CreateStrategicIndicatorDseis < ActiveRecord::Migration
  def change
    create_table :strategic_indicator_dseis do |t|
      t.integer :indicator_value
      t.integer :indicators_sum
      t.integer :numerator_value
      t.integer :denominator_value
      t.boolean :dedicated, default: true
      t.references :strategic_indicator, index: true, foreign_key: true
      t.references :dsei, index: true, foreign_key: true
      t.references :pdsi, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
