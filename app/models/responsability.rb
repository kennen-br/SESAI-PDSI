class Responsability < ActiveRecord::Base
  include Parentable
  auditable

  belongs_to :pdsi
  belongs_to :result
  belongs_to :person
  belongs_to :responsability_level
end
