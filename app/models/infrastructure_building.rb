class InfrastructureBuilding < ActiveRecord::Base
  belongs_to :pdsi
  belongs_to :infrastructure_building_type
  belongs_to :village
end
