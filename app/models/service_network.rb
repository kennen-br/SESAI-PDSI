class ServiceNetwork < ActiveRecord::Base
  auditable

  belongs_to :base_polo
  belongs_to :pdsi

  has_many  :health_establishments
  accepts_nested_attributes_for :health_establishments, reject_if: :all_blank, allow_destroy: true

  has_many  :health_specializeds
  accepts_nested_attributes_for :health_specializeds, reject_if: :all_blank, allow_destroy: true

  validates :city_name,  uniqueness: { scope: [:base_polo, :pdsi], message: 'Cidade já cadastrada no polo base' }
end
