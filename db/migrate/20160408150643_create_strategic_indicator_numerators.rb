class CreateStrategicIndicatorNumerators < ActiveRecord::Migration
  def change
    create_table :strategic_indicator_numerators do |t|
      t.string :name
      t.integer :value
      t.references :strategic_indicator, index: { name: 'strategic_indicator_numerators_index' }, foreign_key: true

      t.timestamps null: false
    end
  end
end
