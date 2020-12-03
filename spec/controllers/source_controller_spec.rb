require 'rails_helper'

RSpec.describe SourcesController, type: :controller do
  render_views

  before :each do
    @user = create(:user)
    sign_in @user
  end
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
    context "with valid params (happy path)" do
      it "creates a new source" do
        expect{post :create, params: {source: valid_attributes}}.to change(Source, :count).by(1) 
        #expect(response).to have_http_status(:success)
      end
    end  
    context "with invalid params (sad path)" do
      it "shows error message" do
        post :create, params: {source: invalid_attributes} 
        expect(response).not_to be_successful
      end
    end      
  end

  describe "show source" do
    context "with valid source (happy path)" do
      it "shows information source" do
        source = Source.create(:name => 's')
        get :show, params: {id: source.id}
        expect(response).to have_http_status(:ok)
      end
    end
    
    context "with invalid source (sad path)" do
      it "raises record not found exception" do
        expect { get :show, params: {id: -1} }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "destroy information source" do
    context "with valid source (happy path)" do
      it "removes information source from the database" do
        source = Source.create(:name => 's')
        expect(Source.all).not_to be_empty
        delete :destroy, params: {id: source.id}
        expect(Source.all).to be_empty     
      end
    end

    context "with invalid source (sad path)" do
      it "raises record not found exception" do
        expect { delete :destroy, params: {id: -1} }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "edit information source" do
    context "with valid source (happy path)" do
    it "renders the template for editing information source with current information source data" do
      source = Source.create(:name => 's')
      get :edit, params: {id: source.id}
      expect(response).to have_http_status(:ok)
    end
  end

  context "with invalid source (sad path)" do
    it "raises record not found exception" do
      expect {get :edit, params: {id: -1}}.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end
end

  describe "update information source" do
    context "with new content for source name (happy path)" do
    it "updates information source in the database with new data" do
      source = Source.create(:name => 's')
      new_source = Source.new(:name => 'ss')
      put :update, params: {id: source.id, :source => new_source.attributes}
      expect(response).to redirect_to(source)
      get :show, params: {id: source.id}
      expect(response.body).to match /ss/im
    end
  end

  context "with content that already exists as another source's name (sad path)" do
    it "redirects to the sources index page without updating the source's name" do
      source = Source.create(:name => 's')
      source2 = Source.create(:name => 'ss')
      new_source = Source.new(:name => 'ss')
      put :update, params: {id: source.id, :source => new_source.attributes}
      expect(response).to redirect_to(sources_path)
      get :show, params: {id: source.id}
      expect(response.body).to match /s/im
    end
  end
end

describe "create source" do
  context "with new content for source's name (happy path)" do
    it "creates new source, saves it in the database and renders the sources index page" do
      source = Source.new(:name => 's')
      count_before = Source.count
      post :create, params: {source: source.attributes}
      count_after = Source.count
      expect(response).to redirect_to(sources_path)
      expect(count_after).to eql(count_before+1)
    end
  end

  context "with content that already exists as another source's name (sad path)" do
    it "redirects to the new source page without adding the information to the database" do
      source = Source.create(:name => 's')
      count_before = Source.count
      source2 = Source.new(:name => 's')
      post :create, params: {source: source2.attributes}
      count_after = Source.count
      expect(response).to redirect_to(new_source_path)
      expect(count_after).to eql(count_before)
    end
  end
end

end
