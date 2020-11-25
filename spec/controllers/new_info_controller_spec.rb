require 'rails_helper'

RSpec.describe InformationsController, :type => :controller do
  render_views

  before :each do
    get :index
  end
 
  describe 'add new info' do
    it 'renders the New Information template' do
      get :new
      expect(response).to have_http_status(:ok)
    end
    it 'fills the template with new information data and sends it to the server' do
      post :new, params: {:title => 'title', :content => 'content', :source_id => '1'}
      expect(response).to have_http_status(:ok)
    end
    it 'calls the controller method that performs information content validation' do
      information = Information.new(:title => 'title', :content => 'content', :source_id => '1')
      expect(information).to be_valid
    end
    it 'adds the information to the database' do
      information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
      expect(Information.all).not_to be_empty
    end
  end
  describe 'add info that has already been added' do
    it 'renders the New Information template' do
      get :new
      expect(response).to have_http_status(:ok)
    end
    it 'fills the template with information data and sends it to the server' do
      post :new, params: {:title => 'title', :content => 'content', :source_id => '1'}
      expect(response).to have_http_status(:ok)
    end
    it 'calls the controller method that performs information content validation' do
      information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
      information2 = Information.create(:title => 'title', :content => 'content', :source_id => '1')
      expect(information2).not_to be_valid
    end
    
    it 'renders the New Information template with an error message' do
      information = Information.create(:title => 'title', :content => 'content', :source_id => '1')
      information2 = Information.create(:title => 'title', :content => 'content', :source_id => '1')
      expect(response.body).to match /<p class="alert">/im
    end
  end
end