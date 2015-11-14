class CreateResponsabilityComments < ActiveRecord::Migration
  def change
    create_table :responsability_comments do |t|
      t.references :responsability, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :comment

      t.timestamps null: false
    end
  end
end
