require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do

    it "routes to #home" do
      expect(:get => "/").to route_to("users#home")
    end

    it "routes to #index" do
      expect(:get => "/usuarios").to route_to("users#index")
    end

    it "routes to #new" do
      expect(:get => "/usuarios/cadastrar").to route_to("users#new")
    end

    it "routes to #edit" do
      expect(:get => "/usuarios/1/alterar").to route_to("users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/usuarios").to route_to("users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/usuarios/1").to route_to("users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/usuarios/1").to route_to("users#update", :id => "1")
    end
  end
end
