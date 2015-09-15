class Emsi < ActiveRecord::Base
  belongs_to :base_polo
  belongs_to :pdsi

  validates :name,  length: { maximum: 255 }, presence: true
end
