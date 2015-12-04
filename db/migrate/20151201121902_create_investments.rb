class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.string :name
      t.integer :parent_id
      t.timestamps null: false
    end

    add_foreign_key :investments,  :investments,  column: :parent_id
  end
end
