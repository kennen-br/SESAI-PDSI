class BudgetForecast < ActiveRecord::Base
  belongs_to :pdsi
  belongs_to :cost
end
