class ServiceNetworkCity < ActiveRecord::Base
  auditable

  belongs_to :service_network

  has_many  :health_establishments, dependent: :destroy
  accepts_nested_attributes_for :health_establishments, reject_if: :all_blank, allow_destroy: true

  has_many  :health_specializeds, dependent: :destroy
  accepts_nested_attributes_for :health_specializeds, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :health_establishments, :health_specializeds, :city_name
end
