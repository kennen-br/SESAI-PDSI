class Village < ActiveRecord::Base
  auditable

  belongs_to :base_polo

  has_and_belongs_to_many :ethnicities

  has_one   :physiographic_data
  has_many  :infrastructure_buildings
  has_many  :infrastructure_sanitations
  has_many  :capai_villages
  has_many :ethnicities_villages

  validates :base_polo, presence: true
  validates :name, length: { maximum: 255 }, uniqueness: { scope: :base_polo }, presence: true
  validates :sesai_id,  numericality: true, uniqueness: true

  def physiographic_datum(pdsi)
    return @physiographic_data unless @physiographic_data.nil?

    item  = PhysiographicData.where(village: self, pdsi: pdsi).first_or_create
    count_population(item)
    item.update city_name: city_name if item.city_name.blank?

    @physiographic_data = item
  end

  def count_population(physiographic_data)
    count = 0
    base_polo = BasePolo.find(physiographic_data.village.base_polo_id)

    base_polo.villages.each do |v|
      count += v.physiographic_data.village_population.to_i if v.physiographic_data.present?
    end
    # debug count
    base_polo.update(population: count)
  end
end
