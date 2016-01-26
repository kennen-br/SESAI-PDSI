class BudgetForecast < ActiveRecord::Base
  belongs_to :pdsi
  belongs_to :cost

  has_many  :budget_forecast_comments, :dependent => :destroy
  accepts_nested_attributes_for :budget_forecast_comments, reject_if: :all_blank, allow_destroy: true

  def self.find_by_cost(id)
    where(cost_id: id)
  end

  def last_comment
    budget_forecast_comments.last
  end
end
