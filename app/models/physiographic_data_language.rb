class PhysiographicDataLanguage < ActiveRecord::Base
  auditable

  belongs_to :physiographic_data
end
