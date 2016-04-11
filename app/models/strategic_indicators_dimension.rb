class StrategicIndicatorsDimension < ActiveRecord::Base
  belongs_to :dsei

  has_many :strategic_indicators_sub_dimensions
  accepts_nested_attributes_for :strategic_indicators_sub_dimensions, reject_if: :all_blank, allow_destroy: true
end
