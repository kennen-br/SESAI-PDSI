class BudgetForecast < ActiveRecord::Base
  belongs_to :pdsi
  belongs_to :cost

  has_many :budget_forecast_comments, dependent: :destroy
  accepts_nested_attributes_for :budget_forecast_comments, reject_if: :all_blank, allow_destroy: true

  has_many :budget_justifiers, dependent: :destroy
  accepts_nested_attributes_for :budget_justifiers, reject_if: :all_blank, allow_destroy: true

  def self.find_by_cost(id)
    where(cost_id: id)
  end

  def comments_by_year(year)
    budget_forecast_comments.where(year: year)
  end

  def last_comment
    budget_forecast_comments.last
  end

  def with_justifier(id)
    budget_justifiers.where(budget_forecast_id: id).first_or_create
  end
end
