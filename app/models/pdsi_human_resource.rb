class PdsiHumanResource < ActiveRecord::Base
  auditable

  belongs_to :pdsi
  belongs_to :human_resource_function
end
