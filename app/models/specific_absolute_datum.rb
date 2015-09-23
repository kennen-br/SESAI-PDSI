class SpecificAbsoluteDatum < ActiveRecord::Base
  auditable

  belongs_to :absolute_datum
  belongs_to :dsei
end
