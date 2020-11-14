require 'rails_helper'

RSpec.describe "FaqsSuggestions", type: :request do
  describe "GET /faqs_suggestions" do
    it "works! (now write some real specs)" do
      get faqs_suggestions_path
      expect(response).to have_http_status(200)
    end
  end
end
