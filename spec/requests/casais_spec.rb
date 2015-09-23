require 'rails_helper'

RSpec.describe "Casais", type: :request do
  describe "GET /casais" do
    it "works! (now write some real specs)" do
      get casais_path
      expect(response).to have_http_status(200)
    end
  end
end
