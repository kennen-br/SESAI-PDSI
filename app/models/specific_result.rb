class SpecificResult < ActiveRecord::Base
  auditable

  belongs_to :result
  belongs_to :dsei
end
