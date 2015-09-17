class Capai < ActiveRecord::Base
  belongs_to :pdsi

  has_many  :capai_villages
end
