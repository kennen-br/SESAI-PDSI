class CreateCorresponsabilities < ActiveRecord::Migration
  def change
    create_table :corresponsabilities do |t|
      t.references :responsability, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
