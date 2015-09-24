class CreateResultCategories < ActiveRecord::Migration
  def change
    create_table :result_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
