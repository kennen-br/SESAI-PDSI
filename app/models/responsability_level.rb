class ResponsabilityLevel < ActiveRecord::Base
  auditable

  has_many  :responsabilities
  has_many  :responsability_references
end
