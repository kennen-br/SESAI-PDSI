class CreateEtnia < ActiveRecord::Migration
  def change
    create_table :etnias do |t|
      t.references :demographic_data, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end

    add_index :etnias,  [:demographic_data_id, :name],  unique: true
  end
end
