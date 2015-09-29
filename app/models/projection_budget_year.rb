class ProjectionBudgetYear < ActiveRecord::Base
  belongs_to :projection_budget

  has_many  :projection_budget_structures
  accepts_nested_attributes_for :projection_budget_structures, reject_if: :all_blank, allow_destroy: true
end
