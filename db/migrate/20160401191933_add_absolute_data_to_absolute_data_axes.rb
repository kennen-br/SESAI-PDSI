class AddAbsoluteDataToAbsoluteDataAxes < ActiveRecord::Migration
  def change
    add_column :absolute_data, :absolute_data_axis_id, :integer
    add_reference :absolute_data, :absolute_data_axes, index: true, foreign_key: true
  end
end
