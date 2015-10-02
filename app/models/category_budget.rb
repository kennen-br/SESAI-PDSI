class CategoryBudget < ActiveRecord::Base
  belongs_to :projection_budget_category
  belongs_to :pdsi
end
