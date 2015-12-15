class Cost < ActiveRecord::Base
  include Parentable
  auditable
  has_many :cost_items, class_name: 'Cost',
  						foreign_key: 'parent_id'
  belongs_to  :parent,  class_name: 'Cost',
  						foreign_key: 'parent_id'

  has_many  :pdsi_costs
  has_many  :pdsi_needs_costs
  has_many  :budget_forecast

  # Todo: Remove this
  has_many  :cost_users

  validates :name,  presence: true, uniqueness: true, length: { maximum: 255 }
end
