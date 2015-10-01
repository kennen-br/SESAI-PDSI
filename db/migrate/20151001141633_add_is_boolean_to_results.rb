class AddIsBooleanToResults < ActiveRecord::Migration
  def change
    add_column :results, :is_boolean, :boolean, default: false
  end
end
