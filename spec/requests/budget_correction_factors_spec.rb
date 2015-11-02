require 'rails_helper'

RSpec.describe "BudgetCorrectionFactors", type: :request do
  describe "GET /budget_correction_factors" do
    it "works! (now write some real specs)" do
      get budget_correction_factors_path
      expect(response).to have_http_status(200)
    end
  end
end
