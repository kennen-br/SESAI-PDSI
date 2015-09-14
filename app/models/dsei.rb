class Dsei < ActiveRecord::Base
  has_many  :base_polos
  has_many  :users

  validates :name, length: { maximum: 255 }, presence: true, uniqueness: true
  validates :sesai_id,  numericality: true, uniqueness: true

  def base_polos_with_children
    base_polos.includes(villages: [physiographic_data: [:physiographic_data_languages]])
  end
end
