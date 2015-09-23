class AbsoluteDataCasai < ActiveRecord::Base
  auditable

  belongs_to :absolute_datum
  belongs_to :casai
  belongs_to :pdsi
end
