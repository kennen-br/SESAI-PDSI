class CreateBudgetForecast < ActiveRecord::Migration
  def change
    create_table :budget_forecasts do |t|
      t.references :cost, index: true, foreign_key: true
      t.references :pdsi, index: true, foreign_key: true
      t.timestamp :updated_at
      t.decimal :reference_forecast
      t.decimal :budget_forecast
      t.decimal :initial_allocation_2016
      t.decimal :dsei_forecast_2016
      t.decimal :revised_allocation_2016
      t.decimal :initial_forecast_2017
      t.decimal :dsei_forecast_2017
      t.decimal :revised_forecast_2017
      t.decimal :initial_forecast_2018
      t.decimal :dsei_forecast_2018
      t.decimal :revised_forecast_2018
      t.decimal :initial_forecast_2019
      t.decimal :dsei_forecast_2019
      t.decimal :revised_forecast_2019
    end
  end
end
