class Village < ActiveRecord::Base
  belongs_to :base_polo

  has_and_belongs_to_many :ethnicities

  has_one   :physiographic_data

  has_many  :infrastructure_buildings
  has_many  :infrastructure_sanitations

  validates :base_polo, presence: true
  validates :name, length: { maximum: 255 }, uniqueness: { scope: :base_polo }, presence: true
  validates :sesai_id,  numericality: true, uniqueness: true

  def physiographic_datum(pdsi)
    return @physiographic_data unless @physiographic_data.nil?

    @physiographic_data = PhysiographicData.where(village: self, pdsi: pdsi).first_or_create
  end
end
