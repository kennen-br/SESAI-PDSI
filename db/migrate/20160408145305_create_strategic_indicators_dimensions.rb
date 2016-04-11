class CreateStrategicIndicatorsDimensions < ActiveRecord::Migration
  def change
    create_table :strategic_indicators_dimensions do |t|
      t.string :name
      t.references :dsei, index: { name: 'index_strategic_indicators_dimension_id' }, foreign_key: true

      t.timestamps null: false
    end
  end
end
