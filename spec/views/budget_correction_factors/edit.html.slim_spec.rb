require 'rails_helper'

RSpec.describe "budget_correction_factors/edit", type: :view do
  before(:each) do
    @budget_correction_factor = assign(:budget_correction_factor, BudgetCorrectionFactor.create!())
  end

  it "renders the edit budget_correction_factor form" do
    render

    assert_select "form[action=?][method=?]", budget_correction_factor_path(@budget_correction_factor), "post" do
    end
  end
end
