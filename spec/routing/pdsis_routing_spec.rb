require "rails_helper"

RSpec.describe PdsisController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pdsis").to route_to("pdsis#index")
    end

    it "routes to #new" do
      expect(:get => "/pdsis/new").to route_to("pdsis#new")
    end

    it "routes to #show" do
      expect(:get => "/pdsis/1").to route_to("pdsis#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pdsis/1/edit").to route_to("pdsis#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pdsis").to route_to("pdsis#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pdsis/1").to route_to("pdsis#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pdsis/1").to route_to("pdsis#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pdsis/1").to route_to("pdsis#destroy", :id => "1")
    end

  end
end
