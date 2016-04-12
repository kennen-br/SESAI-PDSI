class StrategicIndicatorCasai < ActiveRecord::Base
  belongs_to :strategic_indicator
  belongs_to :casai
  belongs_to :pdsi
end
