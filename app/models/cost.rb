class Cost < ActiveRecord::Base
  validates :name,  presence: true, uniqueness: true, length: { maximum: 255 }

  has_many  :cost_users
end
