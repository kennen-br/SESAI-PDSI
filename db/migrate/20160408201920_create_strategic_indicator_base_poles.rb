class CreateStrategicIndicatorBasePoles < ActiveRecord::Migration
  def change
    create_table :strategic_indicator_base_poles do |t|
      t.integer :indicator_value
      t.integer :numerator_value
      t.integer :denominator_value
      t.references :strategic_indicator, index: true, foreign_key: true
      t.references :base_polo, index: true, foreign_key: true
      t.references :pdsi, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
