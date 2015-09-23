class HealthEstablishment < ActiveRecord::Base
  auditable

  belongs_to :service_network
end
