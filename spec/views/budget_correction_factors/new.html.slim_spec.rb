require 'rails_helper'

RSpec.describe "budget_correction_factors/new", type: :view do
  before(:each) do
    assign(:budget_correction_factor, BudgetCorrectionFactor.new())
  end

  it "renders new budget_correction_factor form" do
    render

    assert_select "form[action=?][method=?]", budget_correction_factors_path, "post" do
    end
  end
end
