class CreateAbsoluteDataAxes < ActiveRecord::Migration
  def change
    create_table :absolute_data_axes do |t|

      t.string :name
      t.string :section_name

      t.timestamps null: false
    end
  end
end
