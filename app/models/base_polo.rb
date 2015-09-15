class BasePolo < ActiveRecord::Base
  attr_accessor :cities

  belongs_to :dsei

  has_many  :villages
  has_one   :pdsi_base_polo_datum
  #has_many  :emsis

  validates :name, length: { maximum: 255 }, uniqueness: { scope: :dsei }, presence: true
  validates :sesai_id,  numericality: true, uniqueness: true

  validates :dsei,  presence: true

  def cities
    return @cities unless @cities.nil?

    @cities = Village.select('DISTINCT city_name').where(base_polo: self).map{ |i| i.city_name }
  end

  def pdsi_data(pdsi)
    return @pdsi_base_polo_datum unless @pdsi_base_polo_datum.nil?

    @pdsi_base_polo_datum = PdsiBasePoloDatum.where(base_polo: self, pdsi: pdsi).first_or_create
  end
end
