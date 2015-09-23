class CreateCasais < ActiveRecord::Migration
  def change
    create_table :casais do |t|
      t.references :dsei, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
