class ProjectionBudgetStructure < ActiveRecord::Base
  belongs_to :projection_budget_year

  enum type: [ :casai, :ubsi_1, :ubsi_2, :ubsi_3, :distrital, :polo_base ]
end
