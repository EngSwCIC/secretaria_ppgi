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

  describe "show information" do
    it "shows information source" do
      source = Source.create(:name => 's')
      get :show, params: {id: source.id}
      expect(response).to have_http_status(:ok)
    end
  end

  describe "destroy information source" do
    it "removes information source from the database" do
      source = Source.create(:name => 's')
      expect(Source.all).not_to be_empty
      delete :destroy, params: {id: source.id}
      expect(Source.all).to be_empty     
    end
  end

  describe "edit information source" do
    it "renders the template for editing information source with current information source data" do
      source = Source.create(:name => 's')
      get :edit, params: {id: source.id}
      expect(response).to have_http_status(:ok)
    end
  end

  describe "update information source" do
    it "updates information source in the database with new data" do
      source = Source.create(:name => 's')
      new_source = Source.new(:name => 'ss')
      put :update, params: {id: source.id, :source => new_source.attributes}
      expect(response).to redirect_to(source)
    end
  end

end
