class StrategicIndicator < ActiveRecord::Base
  belongs_to :strategic_indicators_sub_dimension
  belongs_to :pdsi

  has_one :strategic_indicator_denominator
  has_one :strategic_indicator_numerator
end
