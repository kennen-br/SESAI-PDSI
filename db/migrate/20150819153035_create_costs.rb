class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.string  :name,              null: false
      t.boolean :ask_distribution,  default: true
      t.string  :data_type,         null: false

      t.timestamps null: false
    end
  end
end
