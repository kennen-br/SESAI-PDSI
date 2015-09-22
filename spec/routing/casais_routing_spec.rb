require "rails_helper"

RSpec.describe CasaisController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/casais").to route_to("casais#index")
    end

    it "routes to #new" do
      expect(:get => "/casais/new").to route_to("casais#new")
    end

    it "routes to #show" do
      expect(:get => "/casais/1").to route_to("casais#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/casais/1/edit").to route_to("casais#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/casais").to route_to("casais#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/casais/1").to route_to("casais#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/casais/1").to route_to("casais#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/casais/1").to route_to("casais#destroy", :id => "1")
    end

  end
end
