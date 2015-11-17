class DropTransportation < ActiveRecord::Migration
  def change
    drop_table :transportations do |t|
      t.references :demographic_data, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
