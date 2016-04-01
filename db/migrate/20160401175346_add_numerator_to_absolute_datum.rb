class AddNumeratorToAbsoluteDatum < ActiveRecord::Migration
  def change
    add_column :absolute_data, :numerator, :decimal
    add_column :absolute_data, :denominator, :decimal
    add_column :absolute_data, :count, :decimal
  end
end
