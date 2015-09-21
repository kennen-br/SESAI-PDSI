class AbsoluteDatum < ActiveRecord::Base
  belongs_to :absolute_datum_level

  validates :name, length: { maximum: 255 }, presence: true, uniqueness: true
  validates :absolute_datum_level,  presence: true
end
