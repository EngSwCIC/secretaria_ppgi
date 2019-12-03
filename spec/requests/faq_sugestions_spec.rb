require 'rails_helper'

RSpec.describe "FaqSugestions", type: :request do
  describe "GET /faq_sugestions" do
    it "works! (now write some real specs)" do
      get faq_sugestions_path
      expect(response).to have_http_status(200)
    end
  end
end
