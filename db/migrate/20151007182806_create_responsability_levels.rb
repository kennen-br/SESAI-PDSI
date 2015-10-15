class CreateResponsabilityLevels < ActiveRecord::Migration
  def change
    create_table :responsability_levels do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
