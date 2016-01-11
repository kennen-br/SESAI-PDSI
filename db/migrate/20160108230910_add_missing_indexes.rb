class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :users, :user_type_id
    add_index :costs, :parent_id
    add_index :investments, :parent_id
    add_index :responsabilities, :parent_id
    add_index :budget_investments, :investment_id
    add_index :destinations, :origin_village_id
    add_index :destinations, :destination_village_id
  end
end
