class Ethnicity < ActiveRecord::Base
  has_and_belongs_to_many :villages

  validates :name, length: { maximum: 255 }, presence: true, uniqueness: true
  validates :sesai_id,  numericality: true, uniqueness: true
end
