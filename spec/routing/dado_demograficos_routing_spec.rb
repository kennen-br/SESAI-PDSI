require "rails_helper"

RSpec.describe DadoDemograficosController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "/dado_demograficos/1").to route_to("dado_demograficos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dado_demograficos/1/edit").to route_to("dado_demograficos#edit", :id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/dado_demograficos/1").to route_to("dado_demograficos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/dado_demograficos/1").to route_to("dado_demograficos#update", :id => "1")
    end
  end
end
