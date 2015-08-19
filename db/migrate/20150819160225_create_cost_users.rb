class CreateCostUsers < ActiveRecord::Migration
  def change
    create_table :cost_users do |t|
      t.references :cost, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.decimal :value_2015, precision: 8, scale: 2
      t.decimal :value_2016, precision: 8, scale: 2
      t.text :reason
      t.text :criteria
      t.text :distribution

      t.timestamps null: false
    end
  end
end
