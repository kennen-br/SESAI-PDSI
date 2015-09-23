class Cost < ActiveRecord::Base
  auditable

  validates :name,  presence: true, uniqueness: true, length: { maximum: 255 }

  has_many  :cost_users
end
