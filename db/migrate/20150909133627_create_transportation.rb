class CreateTransportation < ActiveRecord::Migration
  def change
    create_table :transportations do |t|
      t.references :demographic_data, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end

    add_index :transportations,  [:demographic_data_id, :name],  unique: true
  end
end
