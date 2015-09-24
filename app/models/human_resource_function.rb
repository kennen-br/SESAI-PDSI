class HumanResourceFunction < ActiveRecord::Base
  auditable

  has_many  :pdsi_human_resources
end
