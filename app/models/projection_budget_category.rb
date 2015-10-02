class ProjectionBudgetCategory < ActiveRecord::Base
  auditable

  has_many  :projection_budget_items
  has_many  :category_budgets
end
