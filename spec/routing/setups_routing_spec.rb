require "rails_helper"

RSpec.describe SetupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/setups").to route_to("setups#index")
    end

    it "routes to #new" do
      expect(:get => "/setups/new").to route_to("setups#new")
    end

    it "routes to #show" do
      expect(:get => "/setups/1").to route_to("setups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/setups/1/edit").to route_to("setups#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/setups").to route_to("setups#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/setups/1").to route_to("setups#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/setups/1").to route_to("setups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/setups/1").to route_to("setups#destroy", :id => "1")
    end
  end
end
