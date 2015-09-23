class InfrastructureBuilding < ActiveRecord::Base
  auditable

  belongs_to :pdsi
  belongs_to :infrastructure_building_type
  belongs_to :village

  validates :pdsi_id,                         presence: true
  validates :infrastructure_building_type_id, presence: true

  def hide_village?
    infrastructure_building_type.name == 'Sede do DSEI' ? true : false
  end
end
