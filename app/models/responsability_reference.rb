class ResponsabilityReference < ActiveRecord::Base
  auditable

  belongs_to :responsability
  belongs_to :pdsi
  belongs_to :result
  belongs_to :responsability_level

end
