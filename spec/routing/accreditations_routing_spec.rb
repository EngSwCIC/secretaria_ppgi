require "rails_helper"

RSpec.describe AccreditationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/accreditations").to route_to("accreditations#index")
    end

    it "routes to #new" do
      expect(:get => "/accreditations/new").to route_to("accreditations#new")
    end

    it "routes to #show" do
      expect(:get => "/accreditations/1").to route_to("accreditations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/accreditations/1/edit").to route_to("accreditations#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/accreditations").to route_to("accreditations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/accreditations/1").to route_to("accreditations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/accreditations/1").to route_to("accreditations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/accreditations/1").to route_to("accreditations#destroy", :id => "1")
    end
  end
end
