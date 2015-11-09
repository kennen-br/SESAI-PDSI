class BasePolo < ActiveRecord::Base
  auditable

  attr_accessor :cities, :ethnicities

  belongs_to :dsei

  has_many  :villages
  has_one   :pdsi_base_polo_datum
  has_many  :emsis
  has_many  :service_networks

  validates :name, length: { maximum: 255 }, uniqueness: { scope: :dsei }, presence: true
  validates :sesai_id,  numericality: true, uniqueness: true

  validates :dsei,  presence: true

  def cities
    return @cities unless @cities.nil?

    @cities = Village.select('DISTINCT city_name').where(base_polo: self).order(:city_name).map{ |i| i.city_name }
  end

  def ethnicities
    return @ethnicities unless @ethnicities.nil?

    @ethnicities  = Ethnicity.joins(:villages).where('villages.base_polo_id = ?', id).order('ethnicities.name')
  end

  def pdsi_data(pdsi)
    return @pdsi_base_polo_datum unless @pdsi_base_polo_datum.nil?

    @pdsi_base_polo_datum = PdsiBasePoloDatum.where(base_polo: self, pdsi: pdsi).first_or_create
  end

  def force_service_networks(pdsi)
    items = service_networks
    return items unless items.blank?

    cities.each { |city| service_networks << ServiceNetwork.new(pdsi: pdsi, base_polo: self, city_name: city) }

    save

    force_service_networks(pdsi)
  end
end
