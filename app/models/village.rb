class Village < ActiveRecord::Base
  auditable

  belongs_to :base_polo

  has_and_belongs_to_many :ethnicities

  has_one   :physiographic_data
  has_many  :infrastructure_buildings
  has_many  :infrastructure_sanitations
  has_many  :capai_villages

  validates :base_polo, presence: true
  validates :name, length: { maximum: 255 }, uniqueness: { scope: :base_polo }, presence: true
  validates :sesai_id,  numericality: true, uniqueness: true

  def physiographic_datum(pdsi)
    return @physiographic_data unless @physiographic_data.nil?

    item  = PhysiographicData.where(village: self, pdsi: pdsi).first_or_create
    item.update city_name: city_name if item.city_name.blank?

    @physiographic_data = item
  end
end
