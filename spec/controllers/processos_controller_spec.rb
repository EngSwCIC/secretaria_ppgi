require 'rails_helper'
require 'capybara/rails'

RSpec.describe ProcessosController, type: :controller do
  before(:each) do
    @secretario = User.new(email: 'usuario_secretario@secretario.com', password: '123456', is_secretary:true)
    @secretario.save!
    sign_in @secretario
  end

  describe 'POST #create' do
    it 'criar um novo processo' do
      @processo = Processo.create(aluno:"João", num_process:"123")
      @processo.should be_an_instante_of Processo
    end
  end
end