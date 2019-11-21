require "rails_helper"

RSpec.describe SolicitationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/solicitations").to route_to("solicitations#index")
    end

    it "routes to #new" do
      expect(:get => "/solicitations/new").to route_to("solicitations#new")
    end

    it "routes to #show" do
      expect(:get => "/solicitations/1").to route_to("solicitations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/solicitations/1/edit").to route_to("solicitations#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/solicitations").to route_to("solicitations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/solicitations/1").to route_to("solicitations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/solicitations/1").to route_to("solicitations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/solicitations/1").to route_to("solicitations#destroy", :id => "1")
    end
  end
end
