class CreateStrategicIndicatorDenominators < ActiveRecord::Migration
  def change
    create_table :strategic_indicator_denominators do |t|
      t.string :name
      t.integer :value
      t.references :strategic_indicator, index: { name: 'strategic_indicator_denominators_index' }, foreign_key: true

      t.timestamps null: false
    end
  end
end
