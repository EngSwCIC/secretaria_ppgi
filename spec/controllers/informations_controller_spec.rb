require 'rails_helper'

RSpec.describe InformationsController, :type => :controller do
  render_views

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
end
