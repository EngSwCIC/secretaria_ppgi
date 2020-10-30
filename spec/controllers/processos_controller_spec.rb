require 'rails_helper'
require 'capybara/rails'

RSpec.describe ProcessosController, type: :controller do
  before(:each) do
    @secretario = User.new(email: 'secretary@secretary.com', password: 'admin123', role: "secretary")
    @secretario.save!
    sign_in @secretario
  end

  describe 'GET#show' do
    it 'deve exibir informações do processo selecionado' do
      get :show, params: {id: processo.to_param}
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end
