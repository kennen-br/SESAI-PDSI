class CreateStrategicIndicators < ActiveRecord::Migration
  def change
    create_table :strategic_indicators do |t|
      t.string :name
      t.string :level
      t.string :data_base
      t.string :calculation_formula
      t.boolean :is_specific, default: false
      t.references :strategic_indicators_sub_dimension, index: { name: 'index_indicators_sub_dimension_id' }, foreign_key: true

      t.timestamps null: false
    end
  end
end
