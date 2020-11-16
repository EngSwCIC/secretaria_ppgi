require "rails_helper"

RSpec.describe SeiProcessesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/sei_processes").to route_to("sei_processes#index")
    end

    it "routes to #new" do
      expect(:get => "/sei_processes/new").to route_to("sei_processes#new")
    end

    it "routes to #show" do
      expect(:get => "/sei_processes/1").to route_to("sei_processes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sei_processes/1/edit").to route_to("sei_processes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/sei_processes").to route_to("sei_processes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sei_processes/1").to route_to("sei_processes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sei_processes/1").to route_to("sei_processes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sei_processes/1").to route_to("sei_processes#destroy", :id => "1")
    end
  end
end
