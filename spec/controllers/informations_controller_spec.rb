require 'rails_helper'

RSpec.describe InformationsController, :type => :controller do
  render_views

  before :each do
    current_user = create(:user)
    sign_in current_user
  end

  describe "GET index" do
    context "with available information" do
      it "assigns @informations" do
        #@fake_results = [double('Information')]
        information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
        expect(Information.all).not_to be_empty
        #expect assigns(:informations).to eq(@fake_results)
      end
  
      it 'selects the index template for rendering' do
        get :index
        #expect(responde).to render_template('index')
        expect(response).to have_http_status(:ok)
        expect(response.body).to match /<h1>.*Lista de Informações/im
      end
    end

    context "with unavailable information" do
      it "assigns @informations" do
        expect(Information.all).to be_empty
      end

      it "renders the index template" do
        get :index
        #expect(responde).to render_template('index')
        expect(response).to have_http_status(:ok)
        expect(response.body).to match /<h2>.*Nenhuma informação publicada/im
      end
    end
  end

  describe "show information" do
    it "shows information details" do
      information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
      get :show, params: {id: information.id}
      expect(response).to have_http_status(:ok)
    end
  end

  describe "destroy information" do
    it "removes information from the database" do
      information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
      expect(Information.all).not_to be_empty
      delete :destroy, params: {id: information.id}
      expect(Information.all).to be_empty     
    end
  end

  describe "edit information" do
    it "renders the template for editing information with current information data" do
      information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
      get :edit, params: {id: information.id}
      expect(response).to have_http_status(:ok)
    end
  end

  describe "update information" do
    it "updates information in the database with new data" do
      information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
      new_information = Information.new(:title => 'new title', :content => 'new content', :source_id => '2')
      put :update, params: {id: information.id, :information => new_information.attributes}
      expect(response).to redirect_to(information)
    end
  end

  describe "create information" do
    it "creates new information and saves it in the database" do
      information = Information.new(:title => 'title', :content => 'content', :source_id => '1')
      post :create, params: {information: information.attributes}
      expect(response).to redirect_to(informations_path)
    end
  end

  

end
