class Investment < ActiveRecord::Base
  include Parentable
  auditable
  belongs_to :parent, class_name: 'Investment'
  has_one :budget_investments
  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
end
