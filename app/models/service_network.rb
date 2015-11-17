class ServiceNetwork < ActiveRecord::Base
  auditable

  belongs_to :base_polo
  belongs_to :pdsi

  has_many  :service_network_cities
  accepts_nested_attributes_for :service_network_cities,  reject_if: :all_blank,  allow_destroy: true

  validates :city_name,  uniqueness: { scope: [:base_polo, :pdsi], message: 'Município já cadastrado no polo base' }
end
