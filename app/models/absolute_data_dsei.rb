class AbsoluteDataDsei < ActiveRecord::Base
  auditable

  belongs_to :absolute_datum
  belongs_to :dsei
  belongs_to :pdsi
end