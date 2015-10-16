class ProjectionBudgetItem < ActiveRecord::Base
  auditable

  belongs_to :projection_budget_category

  has_many  :projection_budgets
  has_many  :pdsi_need_investiments
end
