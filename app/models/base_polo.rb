class BasePolo < ActiveRecord::Base
  belongs_to :dsei

  has_many  :villages

  validates :name, length: { maximum: 255 }, presence: true, uniqueness: true
  validates :sesai_id,  numericality: true, uniqueness: true

  validates :dsei,  presence: true
end
