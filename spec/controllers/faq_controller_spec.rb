require 'rails_helper'

RSpec.describe FAQController, type: :controller do 
    describe "GET #FAQ" do
        it "returns http success" do
            get :FAQ
            expect(response).to have_http_status(:success)
        end
    end
end
