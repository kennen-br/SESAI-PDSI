class AddHumanResourceFunctionIdToPerson < ActiveRecord::Migration
  def change
    add_column :people, :human_resource_function_id, :integer
    remove_column :people, :professional_category, :string
    add_foreign_key :people, :human_resource_functions
  end
end
