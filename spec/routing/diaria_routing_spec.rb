require "rails_helper"

RSpec.describe DiariaController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/diaria").to route_to("diaria#index")
    end

    it "routes to #new" do
      expect(get: "/diaria/new").to route_to("diaria#new")
    end

    it "routes to #show" do
      expect(get: "/diaria/1").to route_to("diaria#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/diaria/1/edit").to route_to("diaria#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/diaria").to route_to("diaria#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/diaria/1").to route_to("diaria#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/diaria/1").to route_to("diaria#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/diaria/1").to route_to("diaria#destroy", id: "1")
    end
  end
end
