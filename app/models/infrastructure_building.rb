class InfrastructureBuilding < ActiveRecord::Base
  belongs_to :pdsi
  belongs_to :infrastructure_building_type
  belongs_to :village

  validates :pdsi_id,                         presence: true
  validates :infrastructure_building_type_id, presence: true
  validates :village_id,                      presence: true
end
