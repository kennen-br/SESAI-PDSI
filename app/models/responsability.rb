class Responsability < ActiveRecord::Base
  include Parentable
  auditable

  belongs_to :pdsi
  belongs_to :result
  belongs_to :person
  belongs_to :responsability_level

  has_many  :corresponsabilities
  accepts_nested_attributes_for :corresponsabilities, reject_if: :all_blank, allow_destroy: true
end
