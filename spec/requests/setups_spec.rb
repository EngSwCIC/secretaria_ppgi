require 'rails_helper'
require 'devise
'
RSpec.describe "Setups", type: :request do
  describe "GET /setups" do
    it "works! (now write some real specs)" do
      get setups_path
      expect(response).to have_http_status(200)
    end
  end
end
