require 'rails_helper'

RSpec.describe SourcesController, type: :controller do
#algo: == :algo=>outra coisa

let(:valid_attributes) { {name: "reitoria"} }
#pode substituir lá no valid do expect q funfa tb

let(:invalid_attributes) { {name: nil} }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new source" do
        expect{post :create, params: {source: valid_attributes}}.to change(Source, :count).by(1) 
        #expect(response).to have_http_status(:success)
      end
    end  
    context "with invalid params" do
      it "show error message" do
        post :create, params: {source: invalid_attributes} 
        expect(response).not_to be_successful
      end
    end      
  end

end
