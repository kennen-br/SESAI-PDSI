class BudgetJustifiersController < ApplicationController
  def edit_justifier
    values = edit_justifier_params
    justifier = BudgetJustifier.find(values['budget_investment_id'] || values['budget_forecast_id'])
    justifier.description = values['description']
    justifier.save
    render json: { status: true }
  end

  private

  def edit_justifier_params
    params.require(:justifier).permit(:budget_investment_id, :budget_forecast_id, :description, :file, :year)
  end
end
