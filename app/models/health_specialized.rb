class HealthSpecialized < ActiveRecord::Base
  auditable

  belongs_to :service_network_city
end
