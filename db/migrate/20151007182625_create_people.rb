class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.references :dsei, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
