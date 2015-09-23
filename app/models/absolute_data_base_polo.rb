class AbsoluteDataBasePolo < ActiveRecord::Base
  auditable

  belongs_to :absolute_datum
  belongs_to :base_polo
  belongs_to :pdsi
end
