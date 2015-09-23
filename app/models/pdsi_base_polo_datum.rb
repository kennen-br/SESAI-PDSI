class PdsiBasePoloDatum < ActiveRecord::Base
  auditable

  belongs_to :pdsi
  belongs_to :base_polo
end
