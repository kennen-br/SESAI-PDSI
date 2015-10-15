class ResponsabilityLevel < ActiveRecord::Base
  auditable

  has_many  :responsabilities
end
