class BudgetForecast < ActiveRecord::Base
  belongs_to :pdsi
  belongs_to :cost

  def self.find_by_cost(id)
    where(cost_id: id)
  end
end
