class PhysiographicDataEthnicity < ActiveRecord::Base
  auditable

  belongs_to :ethnicity
  belongs_to :physiographic_data
end
