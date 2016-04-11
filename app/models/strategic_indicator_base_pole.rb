class StrategicIndicatorBasePole < ActiveRecord::Base
  belongs_to :strategic_indicator
  belongs_to :base_polo
  belongs_to :pdsi
end
