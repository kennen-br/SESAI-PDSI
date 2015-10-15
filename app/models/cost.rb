class Cost < ActiveRecord::Base
  include Parentable
  auditable

  belongs_to  :parent,  class_name: 'Cost'

  has_many  :pdsi_costs
  has_many  :pdsi_needs_costs

  # Todo: Remove this
  has_many  :cost_users

  validates :name,  presence: true, uniqueness: true, length: { maximum: 255 }
end
