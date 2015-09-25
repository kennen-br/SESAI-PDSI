class AddParentIdToResultCategory < ActiveRecord::Migration
  def change
    add_column :result_categories, :parent_id, :integer

    add_foreign_key :result_categories,  :result_categories,  column: :parent_id
  end
end
