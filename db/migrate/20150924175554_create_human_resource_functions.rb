class CreateHumanResourceFunctions < ActiveRecord::Migration
  def change
    create_table :human_resource_functions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
