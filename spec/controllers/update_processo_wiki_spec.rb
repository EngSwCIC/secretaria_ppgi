require 'rails_helper'
require 'capybara/rails'

RSpec.describe ProcessosController, type: :controller do
  before(:each) do
    @secretario = User.new(email: 'usuario_secretario@secretario.com', password: '123456', is_secretary:true)
    @secretario.save!
    sign_in @secretario
  end

  describe 'PUT #update' do
    it 'editar processo existente' do
      @processo = Processo.find(1)
      @processo = Processo.update(numero_SEI:"0423-123477/2020", status:"finalizado")
      expect(@processo.numero_SEI).to eq('0423-123477/2020') 
      expect(@processo.status).to eq('finalizado') 
    end
  end
end