require "rails_helper"

RSpec.describe FaqsSuggestionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/faqs_suggestions").to route_to("faqs_suggestions#index")
    end

    it "routes to #new" do
      expect(:get => "/faqs_suggestions/new").to route_to("faqs_suggestions#new")
    end

    it "routes to #show" do
      expect(:get => "/faqs_suggestions/1").to route_to("faqs_suggestions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/faqs_suggestions/1/edit").to route_to("faqs_suggestions#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/faqs_suggestions").to route_to("faqs_suggestions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/faqs_suggestions/1").to route_to("faqs_suggestions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/faqs_suggestions/1").to route_to("faqs_suggestions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/faqs_suggestions/1").to route_to("faqs_suggestions#destroy", :id => "1")
    end
  end
end
