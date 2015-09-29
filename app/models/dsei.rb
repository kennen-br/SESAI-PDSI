class Dsei < ActiveRecord::Base
  auditable

  attr_accessor :villages

  has_many  :base_polos
  has_many  :casais
  has_many  :users
  has_many  :absolute_data_dseis
  has_many  :specific_absolute_data
  has_many  :specific_results
  has_one   :pdsi

  validates :name, length: { maximum: 255 }, presence: true, uniqueness: true
  validates :sesai_id,  numericality: true, uniqueness: true

  def base_polos_with_emsis
    base_polos.includes(:pdsi_base_polo_datum, :emsis)
  end

  def base_polos_with_physiographic_data(include_polo_base = true)
    if include_polo_base
      base_polos.includes(:pdsi_base_polo_datum, villages: [physiographic_data: [:physiographic_data_languages]])
    else
      base_polos.includes(villages: [physiographic_data: [:physiographic_data_languages]])
    end
  end

  def base_polos_with_service_networks
    base_polos.includes(service_networks: [:health_establishments, :health_specializeds])
  end

  def villages
    return @villages unless @villages.nil?

    @villages = {}

    Dsei.eager_load(base_polos: [:villages]).where(id: id).first.base_polos.each do |base_polo|
      @villages[base_polo.id]  = { name: base_polo.name, villages: {} }
      base_polo.villages.each do |village|
        @villages[base_polo.id][:villages][village.id]  = village.name
      end
    end

    @villages
  end

  def pdsi
    return @pdsi unless @pdsi.nil?

    @pdsi = Pdsi.where(dsei: self).first_or_create

    @pdsi
  end
end
