class AddIsSpecificToAbsoluteDatum < ActiveRecord::Migration
  def change
    add_column :absolute_data, :is_specific, :boolean, default: false
  end
end
