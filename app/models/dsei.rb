class Dsei < ActiveRecord::Base
  has_many  :base_polos
  has_many  :users

  validates :name, length: { maximum: 255 }, presence: true, uniqueness: true
  validates :sesai_id,  numericality: true, uniqueness: true

  def base_polos_with_emsis
    base_polos.includes(:pdsi_base_polo_datum, :emsis)
  end

  def base_polos_with_physiographic_data
    base_polos.includes(villages: [physiographic_data: [:physiographic_data_languages]])
  end

  def base_polos_with_service_networks
    base_polos.includes(service_networks: [:health_establishments, :health_specializeds])
  end
end
