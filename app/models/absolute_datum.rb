class AbsoluteDatum < ActiveRecord::Base
  belongs_to :absolute_datum_level

  has_many  :absolute_data_dseis

  validates :name, length: { maximum: 255 }, presence: true, uniqueness: true
  validates :absolute_datum_level,  presence: true
end
