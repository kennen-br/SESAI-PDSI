require "rails_helper"

RSpec.describe TextTemplatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/templates").to route_to("text_templates#index")
    end

    it "routes to #edit" do
      expect(:get => "/templates/1/alterar/my-section").to route_to("text_templates#edit", :id => "1", :section => 'my-section')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/templates/1/alterar/my-section").to route_to("text_templates#update", :id => "1", :section => 'my-section')
    end
  end
end
