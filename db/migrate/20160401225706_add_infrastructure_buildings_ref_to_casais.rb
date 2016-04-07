class AddInfrastructureBuildingsRefToCasais < ActiveRecord::Migration
  def change
    add_reference :casais, :infrastructure_building, index: true, foreign_key: true
  end
end
