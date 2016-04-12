class InfrastructureBuilding < ActiveRecord::Base
  auditable

  belongs_to :pdsi
  belongs_to :infrastructure_building_type
  belongs_to :village

  validates_presence_of :pdsi_id,
                        :infrastructure_building_type_id,
                        :name,
                        :uf,
                        :city_name,
                        :cnes


  def hide_village?
    infrastructure_building_type.name == 'Sede do DSEI' ? true : false
  end
end
