class AddDescriptionToAbsoluteDatum < ActiveRecord::Migration
  def change
    add_column :absolute_data, :numerator_text, :text
    add_column :absolute_data, :denominator_text, :text
  end
end
