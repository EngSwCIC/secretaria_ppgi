require 'rails_helper'

RSpec.describe InformationsController, :type => :controller do
  render_views

  before :each do
    @user = create(:user)
    sign_in @user
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
    context "with available information (happy path)" do
      it "shows information details" do
        information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
        get :show, params: {id: information.id}
        expect(response).to have_http_status(:ok)
      end
    end

    context "with unavailable information (sad path)" do
      it "raises record not found exception" do
        expect { get :show, params: {id: -1} }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "destroy information" do
    context "with available information (happy path)" do
      it "removes information from the database" do
        information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
        expect(Information.all).not_to be_empty
        delete :destroy, params: {id: information.id}
        expect(Information.all).to be_empty     
      end      
    end

    context "with unavailable information (sad path)" do
      it "raises record not found exception" do
        expect { delete :destroy, params: {id: -1} }.to raise_exception(ActiveRecord::RecordNotFound)
      end      
    end
  end

  describe "edit information" do
    context "with available information (happy path)" do
      it "renders the template for editing information with current information data" do
        information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
        get :edit, params: {id: information.id}
        expect(response).to have_http_status(:ok)
      end
    end
    
    context "with unavailable information (sad path)" do
      it "raises record not found exception" do
        expect {get :edit, params: {id: -1}}.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end  
  end

  describe "update information" do
    context "with new content for information body (happy path)" do
      it "updates information in the database with new data" do
        information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
        new_information = Information.new(:title => 'new title', :content => 'new content', :source_id => '2')
        put :update, params: {id: information.id, :information => new_information.attributes}
        expect(response).to redirect_to(information)
        get :show, params: {id: information.id}
        expect(response.body).to match /new content/im
      end
    end

    context "with content that already exists as another information's body (sad path)" do
      it "redirects to the informations index page without updating the information's content" do
        information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
        information2 = Information.create(:title => 'title2', :content => 'content2', :source_id => '2')
        new_information = Information.new(:title => 'new title', :content => 'content2', :source_id => '2')
        put :update, params: {id: information.id, :information => new_information.attributes}
        expect(response).to redirect_to(informations_path)
        get :show, params: {id: information.id}
        expect(response.body).to match /content/im
      end
    end
  end

  describe "create information" do
    context "with new content for information body (happy path)" do
      it "creates new information, saves it in the database and renders the informations index page" do
        information = Information.new(:title => 'title', :content => 'content', :source_id => '1')
        count_before = Information.count
        post :create, params: {information: information.attributes}
        count_after = Information.count
        expect(response).to redirect_to(informations_path)
        expect(count_after).to eql(count_before+1)
      end
    end

    context "with content that already exists as another information's body (sad path)" do
      it "redirects to the new information page without adding the information to the database" do
        information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
        count_before = Information.count
        information2 = Information.new(:title => 'title2', :content => 'content', :source_id => '1')
        post :create, params: {information: information2.attributes}
        count_after = Information.count
        expect(response).to redirect_to(new_information_path)
        expect(count_after).to eql(count_before)
      end
    end
  end

  describe "filter information by source" do
    context "the selected source exists in the database (happy path)" do
      it "displays only informations posted by the selected source" do
        information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
        information2 = Information.create(:title => 'title2', :content => 'content2', :source_id => '2')
        get :index, params: {:information => {:source_id => '1'}}
        expect(response).to have_http_status(:ok)
        expect(response.body).to match /<td>title/im
        expect(response.body).not_to match /<td>title2/im
      end
    end

    context "the selected source does not exist in the database (sad path)" do
      it "displays the informations index page with no informations shown" do
        information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
        get :index, params: {:information => {:source_id => '3'}}
        expect(response).to have_http_status(:ok)
        expect(response.body).to match /<h2>.*Nenhuma informação publicada/im
      end
    end
  end

  describe "get information index page" do
    context "as an administrator" do
      it "displays links for creating and deleting informations" do
        information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
        get :index
        expect(response.body).to match /Remover/im
        expect(response.body).to match /Cadastrar nova informação/im
      end
    end

    context "as a non administrator user" do
      it "does not display links for creating and deleting informations" do
        sign_out @user
        @user2 = create(:user, :professor)
        sign_in @user2
        get :index
        expect(response.body).not_to match /Remover/im
        expect(response.body).not_to match /Cadastrar nova informação/im
      end
    end
  end

  describe "get information edit page" do
    context "as an administrator (happy path)" do
      it "renders the edit information page" do
        information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
        get :edit, params: {id: information.id}
        expect(response.body).to match /Editar informação/im
      end
    end

    context "as a non administrator user (sad path)" do
      it "renders the access denied page" do
        sign_out @user
        @user2 = create(:user, :professor)
        sign_in @user2
        information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
        get :edit, params: {id: information.id}
        expect(response.body).to match /negado/im
        expect(response.body).not_to match /Editar informação/im
      end
    end
  end

  describe "get information creation page" do
    context "as an administrator (happy path)" do
      it "renders the create information page" do
        get :new
        expect(response.body).to match /Adicionar uma nova informação/im
      end
    end

    context "as a non administrator user (sad path)" do
      it "renders the access denied page" do
        sign_out @user
        @user2 = create(:user, :professor)
        sign_in @user2
        get :new
        expect(response.body).to match /negado/im
        expect(response.body).not_to match /Adicionar uma nova informação/im
      end
    end
  end
  

end
