class Village < ActiveRecord::Base
  belongs_to :base_polo

  has_and_belongs_to_many :ethnicities

  has_one   :physiographic_data

  validates :base_polo, presence: true
  validates :name, length: { maximum: 255 }, uniqueness: { scope: :base_polo }, presence: true
  validates :sesai_id,  numericality: true, uniqueness: true

  def physiographic_data
    return @physiographic_data unless @physiographic_data.nil?

    @physiographic_data = PhysiographicData.where(village: self).first_or_create
  end
end
