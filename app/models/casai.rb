class Casai < ActiveRecord::Base
  belongs_to :dsei

  validates :name, length: { maximum: 255 }, uniqueness: { scope: :dsei }, presence: true
  validates :dsei,  presence: true
end
