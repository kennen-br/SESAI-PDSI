class HumanResourceFunction < ActiveRecord::Base
  auditable

  has_many  :pdsi_human_resources, inverse_of: :human_resource_function
end
