class StrategicIndicatorsSubDimension < ActiveRecord::Base
  belongs_to :strategic_indicators_dimension

  has_many :strategic_indicators
  accepts_nested_attributes_for :strategic_indicators, reject_if: :all_blank, allow_destroy: true
end
