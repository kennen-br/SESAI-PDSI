class CreateStrategicIndicatorsSubDimensions < ActiveRecord::Migration
  def change
    create_table :strategic_indicators_sub_dimensions do |t|
      t.string :name
      t.references :strategic_indicators_dimension, index: { name: 'index_indicators_dimension_id' }, foreign_key: true

      t.timestamps null: false
    end
  end
end
