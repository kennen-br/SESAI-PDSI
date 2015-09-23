class Casai < ActiveRecord::Base
  auditable

  belongs_to :dsei

  has_many  :absolute_data_casais

  validates :name, length: { maximum: 255 }, uniqueness: { scope: :dsei }, presence: true
  validates :dsei,  presence: true
end
