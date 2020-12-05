require 'rails_helper'

RSpec.describe "Admins", type: :request do

  describe "GET /panel" do
    it "returns http success" do
      get "/admin/panel"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/admin/index"
      expect(response).to have_http_status(:success)
    end
  end

end
