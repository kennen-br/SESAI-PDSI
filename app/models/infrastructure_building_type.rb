class InfrastructureBuildingType < ActiveRecord::Base
  auditable

  has_many  :infrastructure_buildings
end
