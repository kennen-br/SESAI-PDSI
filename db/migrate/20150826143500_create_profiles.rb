class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references  :user,  null: false,  index: true, foreign_key: true
      t.string      :name,  null: false

      t.timestamps null: false
    end
  end
end
