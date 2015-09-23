require "rails_helper"

RSpec.describe AbsoluteDataController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/absolute_data").to route_to("absolute_data#index")
    end

    it "routes to #new" do
      expect(:get => "/absolute_data/new").to route_to("absolute_data#new")
    end

    it "routes to #show" do
      expect(:get => "/absolute_data/1").to route_to("absolute_data#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/absolute_data/1/edit").to route_to("absolute_data#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/absolute_data").to route_to("absolute_data#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/absolute_data/1").to route_to("absolute_data#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/absolute_data/1").to route_to("absolute_data#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/absolute_data/1").to route_to("absolute_data#destroy", :id => "1")
    end

  end
end
