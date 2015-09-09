class Village < ActiveRecord::Base
  belongs_to :base_polo

  has_and_belongs_to_many :ethnicities

  validates :base_polo, presence: true
  validates :name, length: { maximum: 255 }, presence: true
  validates :sesai_id,  numericality: true, uniqueness: true
end
