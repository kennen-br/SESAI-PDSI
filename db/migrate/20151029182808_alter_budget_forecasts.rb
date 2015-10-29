class AlterBudgetForecasts < ActiveRecord::Migration
  def change
    rename_column :budget_forecasts, :initial_allocation_2016, :initial_forecast_2016
    rename_column :budget_forecasts, :revised_allocation_2016, :revised_forecast_2016
  end
end
