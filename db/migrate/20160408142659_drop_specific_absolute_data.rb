class DropSpecificAbsoluteData < ActiveRecord::Migration
  def change
    drop_table :specific_absolute_data
  end
end
