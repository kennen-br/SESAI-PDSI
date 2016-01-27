class AddBasePoloIdToInfrastructureSanitations < ActiveRecord::Migration
  def change
    add_column :infrastructure_sanitations, :base_polo_id, :integer
  end
end
