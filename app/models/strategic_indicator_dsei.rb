class StrategicIndicatorDsei < ActiveRecord::Base
  belongs_to :strategic_indicator
  belongs_to :dsei
  belongs_to :pdsi
end
