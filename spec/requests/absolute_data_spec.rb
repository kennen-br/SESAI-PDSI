require 'rails_helper'

RSpec.describe "AbsoluteData", type: :request do
  describe "GET /absolute_data" do
    it "works! (now write some real specs)" do
      get absolute_data_path
      expect(response).to have_http_status(200)
    end
  end
end
