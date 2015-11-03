class People < ActiveRecord::Base
  auditable

  belongs_to :dsei

  validates :name, length: { mininum: 3, maximum: 255 }, uniqueness: { scope: :dsei }, presence: true
end
