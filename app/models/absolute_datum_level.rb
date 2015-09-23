class AbsoluteDatumLevel < ActiveRecord::Base
  auditable

  has_many  :absolute_data

  validates :name, length: { maximum: 255 }, presence: true, uniqueness: true

  def to_s
    name
  end
end
