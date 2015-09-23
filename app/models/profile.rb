class Profile < ActiveRecord::Base
  auditable

  belongs_to :user

  validates :name, length: { maximum: 255 }, presence: true
end
