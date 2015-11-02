require 'rails_helper'

RSpec.describe "budget_correction_factors/index", type: :view do
  before(:each) do
    assign(:budget_correction_factors, [
      BudgetCorrectionFactor.create!(),
      BudgetCorrectionFactor.create!()
    ])
  end

  it "renders a list of budget_correction_factors" do
    render
  end
end
