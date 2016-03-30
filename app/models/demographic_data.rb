class DemographicData < ActiveRecord::Base
  auditable
  include ActionView::Helpers::NumberHelper

  belongs_to :pdsi

  validates :extensao_territorial,  length: { maximum: 255 }, presence: false
  validates :municipio_sede,        length: { maximum: 255 }, presence: false
  validates :endereco,              length: { maximum: 255 }, presence: false

  validates_presence_of :numero_sede_polos_base, :numero_ubsi

  def extensao_territorial_km
    number_to_human(extensao_territorial.to_f, precision: 5, separator: '.',
                                               units: { unit: 'metros', thousand: 'km²' })
  end
end
