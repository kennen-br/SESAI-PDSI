class Capai < ActiveRecord::Base
  belongs_to :pdsi

  has_many  :capai_villages
  accepts_nested_attributes_for :capai_villages, reject_if: :all_blank, allow_destroy: true
end
