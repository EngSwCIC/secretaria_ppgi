require "rails_helper"

RSpec.describe FaqSugestionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/faq_sugestions").to route_to("faq_sugestions#index")
    end

    it "routes to #new" do
      expect(:get => "/faq_sugestions/new").to route_to("faq_sugestions#new")
    end

    it "routes to #show" do
      expect(:get => "/faq_sugestions/1").to route_to("faq_sugestions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/faq_sugestions/1/edit").to route_to("faq_sugestions#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/faq_sugestions").to route_to("faq_sugestions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/faq_sugestions/1").to route_to("faq_sugestions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/faq_sugestions/1").to route_to("faq_sugestions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/faq_sugestions/1").to route_to("faq_sugestions#destroy", :id => "1")
    end
  end
end
