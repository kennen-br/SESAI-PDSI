class Cost < ActiveRecord::Base
  include Parentable
  auditable

  belongs_to  :parent,  class_name: 'Cost'

  has_many  :children,  class_name: 'Cost', foreign_key: :parent_id
  has_many  :pdsi_costs

  # Todo: Remove this
  has_many  :cost_users

  validates :name,  presence: true, uniqueness: true, length: { maximum: 255 }
end
