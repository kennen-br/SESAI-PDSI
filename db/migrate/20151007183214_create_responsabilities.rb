class CreateResponsabilities < ActiveRecord::Migration
  def change
    create_table :responsabilities do |t|
      t.references :pdsi, index: true, foreign_key: true
      t.references :result, index: true, foreign_key: true
      t.integer :parent_id
      t.references :person, index: true, foreign_key: true
      t.references :responsability_level, index: true, foreign_key: true
      t.date :deadline
      t.text :external_actors
      t.text :comments

      t.timestamps null: false
    end

    add_foreign_key :responsabilities,  :responsabilities,  column: :parent_id
  end
end
