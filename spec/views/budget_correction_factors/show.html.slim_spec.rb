require 'rails_helper'

RSpec.describe "budget_correction_factors/show", type: :view do
  before(:each) do
    @budget_correction_factor = assign(:budget_correction_factor, BudgetCorrectionFactor.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
