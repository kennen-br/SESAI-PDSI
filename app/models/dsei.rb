class Dsei < ActiveRecord::Base
  has_many  :base_polos

  validates :name, length: { maximum: 255 }, presence: true, uniqueness: true
  validates :sesai_id,  numericality: true, uniqueness: true
end
