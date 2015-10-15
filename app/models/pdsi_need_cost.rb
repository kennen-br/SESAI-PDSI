class PdsiNeedCost < ActiveRecord::Base
  belongs_to :cost
  belongs_to :pdsi
end
