require 'rails_helper'

RSpec.describe "Accreditations", type: :request do
  describe "GET /accreditations" do
    it "works! (now write some real specs)" do
      get accreditations_path
      expect(response).to have_http_status(200)
    end
  end
end
