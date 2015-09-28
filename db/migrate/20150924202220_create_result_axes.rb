class CreateResultAxes < ActiveRecord::Migration
  def change
    create_table :result_axes do |t|
      t.string :name
      t.string :section_name

      t.timestamps null: false
    end
  end
end
