class ProjectionBudget < ActiveRecord::Base
  auditable

  belongs_to :projection_budget_item
  belongs_to :pdsi

  has_many  :projection_budget_years
  accepts_nested_attributes_for :projection_budget_years, reject_if: :all_blank, allow_destroy: true
end
