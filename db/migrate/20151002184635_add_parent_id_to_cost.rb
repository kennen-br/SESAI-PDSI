class AddParentIdToCost < ActiveRecord::Migration
  def change
    add_column :costs, :parent_id, :integer

    add_foreign_key :costs,  :costs,  column: :parent_id
  end
end
