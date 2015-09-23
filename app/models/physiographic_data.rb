class PhysiographicData < ActiveRecord::Base
  auditable

  belongs_to :pdsi
  belongs_to :village

  has_many :physiographic_data_languages
  accepts_nested_attributes_for :physiographic_data_languages, reject_if: :all_blank, allow_destroy: true
end
