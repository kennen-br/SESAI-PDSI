class CreateResultStrategies < ActiveRecord::Migration
  def change
    create_table :result_strategies do |t|
      t.references :result_axis, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
