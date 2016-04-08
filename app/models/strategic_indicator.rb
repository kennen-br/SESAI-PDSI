class StrategicIndicator < ActiveRecord::Base
  belongs_to :strategic_indicators_sub_dimension
  belongs_to :pdsi

  has_many :strategic_indicator_denominator
  accepts_nested_attributes_for :strategic_indicator_denominator, reject_if: :all_blank, allow_destroy: true

  has_many :strategic_indicator_numerator
  accepts_nested_attributes_for :strategic_indicator_numerator, reject_if: :all_blank, allow_destroy: true
end
