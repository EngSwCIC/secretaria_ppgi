require "rails_helper"

RSpec.describe WikisController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/wikis").to route_to("wikis#index")
    end

    it "routes to #new" do
      expect(:get => "/wikis/new").to route_to("wikis#new")
    end

    it "routes to #show" do
      expect(:get => "/wikis/1").to route_to("wikis#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/wikis/1/edit").to route_to("wikis#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/wikis").to route_to("wikis#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/wikis/1").to route_to("wikis#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/wikis/1").to route_to("wikis#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/wikis/1").to route_to("wikis#destroy", :id => "1")
    end
  end
end
