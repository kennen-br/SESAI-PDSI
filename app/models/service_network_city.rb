class ServiceNetworkCity < ActiveRecord::Base
  auditable

  belongs_to :service_network

  has_many  :health_establishments
  accepts_nested_attributes_for :health_establishments, reject_if: :all_blank, allow_destroy: true

  has_many  :health_specializeds
  accepts_nested_attributes_for :health_specializeds, reject_if: :all_blank, allow_destroy: true
end
