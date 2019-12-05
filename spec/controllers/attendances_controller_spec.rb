require 'rails_helper'
RSpec.feature AttendancesController , type: :controller do

    let(:valid_attributes_search) {
        {search: "Nada"}
    }
    let(:empty_attributes_search) {
        {search: ""}
    }
    describe "GET #index" do
        it "sucess on index" do
            get :index
            expect(response).to have_http_status(:success)
        end
    end
    describe "POST #search" do
        context "with valid params" do
            it "search was sucessful" do
                post :search, params: {p: valid_attributes_search}
                expect(response).to have_http_status(:found)
            end
            it "search was invalid" do
                post :search, params: {p: empty_attributes_search}
                expect(response).to have_http_status(:found)
            end
        end
    end
    describe "GET #new" do
        it "returns a success response" do
            get :new
            expect(response).to have_http_status(:success)
        end
    end

end