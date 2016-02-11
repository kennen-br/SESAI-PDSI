class Person < ActiveRecord::Base
  auditable

  belongs_to :pdsi
  belongs_to :dsei
  has_many  :responsabilities
  belongs_to :human_resource_function

  validates :name, length: { mininum: 3, maximum: 255 }, uniqueness: { scope: :dsei }, presence: true

  scope :sesai_people, -> { where(is_sesai_central: true) }
end
