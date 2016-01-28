class AddNewFieldsToPeople < ActiveRecord::Migration
  def change
    add_column :people, :pdsi_id, :integer
    add_column :people, :indigenous_worker, :boolean
    add_column :people, :professional_category, :string
    add_column :people, :role, :string
    add_column :people, :bond_type, :string
    add_column :people, :workplace, :string
  end
end
