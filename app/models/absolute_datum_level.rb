class AbsoluteDatumLevel < ActiveRecord::Base
  has_many  :absolute_data

  validates :name, length: { maximum: 255 }, presence: true, uniqueness: true

  def to_s
    name
  end
end
