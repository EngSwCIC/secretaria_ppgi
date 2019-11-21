require 'rails_helper'

RSpec.describe "Solicitations", type: :request do
  describe "GET /solicitations" do
    it "works! (now write some real specs)" do
      get solicitations_path
      expect(response).to have_http_status(200)
    end
  end
end
