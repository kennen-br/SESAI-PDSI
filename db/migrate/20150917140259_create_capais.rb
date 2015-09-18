class CreateCapais < ActiveRecord::Migration
  def change
    create_table :capais do |t|
      t.references :pdsi, index: true, foreign_key: true
      t.string  :city_name
      t.string  :uf
      t.string  :type
      t.integer :host_capacity

      t.timestamps null: false
    end
  end
end
