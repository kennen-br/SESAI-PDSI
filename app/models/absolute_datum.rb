class AbsoluteDatum < ActiveRecord::Base
  auditable

  belongs_to :absolute_datum_level

  has_many  :absolute_data_dseis
  has_many  :absolute_data_base_polos
  has_many  :absolute_data_casais
  has_many  :specific_absolute_data

  validates :name, length: { maximum: 255 }, presence: true, uniqueness: true
  validates :absolute_datum_level,  presence: true
end
